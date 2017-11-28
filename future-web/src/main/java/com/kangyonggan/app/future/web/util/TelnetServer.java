package com.kangyonggan.app.future.web.util;

import com.kangyonggan.app.future.biz.service.RedisService;
import com.kangyonggan.app.future.biz.util.SpringUtils;
import lombok.extern.log4j.Log4j2;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;

import java.io.*;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Set;

@Component
@Log4j2
public class TelnetServer {

    private ServerSocket serverSocket;
    private static boolean isRunning;

    public TelnetServer() {
        init();
    }

    private void init() {
        if (isRunning) {
            return;
        }
        isRunning = true;

        new Thread() {
            @Override
            public void run() {
                try {
                    serverSocket = new ServerSocket(8521);
                    log.info("Telnet服务端正在8521端口监听...");
                } catch (IOException e) {
                    log.warn("Telnet服务端启动异常", e);
                    return;
                }

                while (true) {
                    Socket socket = null;
                    try {
                        socket = serverSocket.accept();
                        processSocket(socket);
                    } catch (Exception e) {
                        log.warn("Telnet客户端连接异常", e);
                        if (socket != null) {
                            try {
                                socket.close();
                            } catch (IOException e1) {
                                log.warn("socket关闭异常", e1);
                            }
                        }
                    }
                }
            }
        }.start();
    }

    private void processSocket(Socket socket) throws Exception {
        RedisService redisService = SpringUtils.getBean(RedisService.class);
        BufferedReader reader = new BufferedReader(new InputStreamReader(socket.getInputStream()));
        BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(socket.getOutputStream()));
        String prefix = "127.0.0.1:8521>";
        writer.write(prefix);
        writer.flush();

        new Thread() {
            @Override
            public void run() {
                try {
                    String command;
                    while ((command = reader.readLine()) != null) {
                        command = command.trim();
                        if (StringUtils.isEmpty(command)) {
                            writer.write(prefix);
                            writer.flush();
                            continue;
                        }
                        log.info("客户端指令:{}", command);

                        if ("exit".equals(command)) {
                            writer.write("logout");
                            writer.newLine();
                            writer.flush();
                            writer.close();
                            reader.close();
                            socket.close();
                            break;
                        } else if (command.startsWith("keys")) {
                            try {
                                String cmds[] = command.split("\\s");
                                Set<String> keys = redisService.getKeys(cmds[1]);
                                for (String key : keys) {
                                    writer.write(key);
                                    writer.newLine();
                                }
                                writer.write("Total " + keys.size());
                            } catch (Exception e) {
                                log.warn("错误的客户端指令", e);
                                writer.write("bad command 'keys', e.g: keys future:user*");
                            }
                        } else if (command.startsWith("del")) {
                            try {
                                String cmds[] = command.split("\\s");
                                redisService.deleteAll(cmds[1]);
                                writer.write("done");
                            } catch (Exception e) {
                                log.warn("错误的客户端指令", e);
                                writer.write("bad command 'keys', e.g: keys future:user*");
                            }
                        } else {
                            writer.write("command not found '" + command + "'");
                        }
                        writer.newLine();
                        writer.write(prefix);
                        writer.flush();
                    }
                } catch (Exception e) {
                    log.warn("未知异常", e);
                    try {
                        if (writer != null) {
                            writer.close();
                        }
                        if (reader != null) {
                            reader.close();
                        }
                        if (socket != null) {
                            socket.close();
                        }
                    } catch (Exception e1) {
                        log.warn("关闭流异常", e1);
                    }
                }
            }
        }.start();
    }

}
