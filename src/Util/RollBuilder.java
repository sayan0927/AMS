package Util;

import Database.DatabaseController;

import java.time.Year;
import java.util.List;

public class RollBuilder {

    public static String buildRoll(String roll_temp,String courseId, DatabaseController DAO)
    {


        List<String> rollPrefixAndSuffix=DAO.getRollPrefixAndSuffix(courseId);
        Year year=Year.now();
        String y = String.valueOf(year.toString().charAt(2)) + year.toString().charAt(3);

        return rollPrefixAndSuffix.get(0)+ y +roll_temp+rollPrefixAndSuffix.get(1);
    }
}
