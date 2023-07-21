/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.Plant;
import java.util.ArrayList;

/**
 *
 * @author PhuHV
 */
public class PlantDAO {
    public static ArrayList<Plant> getPlants(String key) throws Exception {
        ArrayList<Plant> list = new ArrayList<>();
        list.add(new Plant(1, "hoa hong"));
        list.add(new Plant(2, "rau muong"));
        return list;
    }
    public static Plant getPlant(int id) {
        return null;
    }
}
