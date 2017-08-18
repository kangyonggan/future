package com.kangyonggan.app.future.model.dto;

import com.kangyonggan.app.future.model.vo.Favorite;
import lombok.Data;

import java.util.List;

/**
 * @author kangyonggan
 * @since 8/11/17
 */
@Data
public class FindFavoritesResponse extends CommonResponse {

    private List<Favorite> favorites;

    @Override
    public String toString() {
        return "FindFavoritesResponse{" +
                "favorites=" + favorites +
                '}' + "," + super.toString();
    }
}

