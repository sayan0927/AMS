/**
 *
 * @author Sayan
 */
package Util;

public class CreateRandomPassword {



    public static String getRandomPassword()
    {


        int length =8;
        // Password chosen from this string at random
        String AlphaNumericString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ" + "0123456789" + "abcdefghijklmnopqrstuvxyz";

        // create StringBuffer size of AlphaNumericString
        StringBuilder password = new StringBuilder(length);

        for (int i = 0; i < length; i++) {

            // generate a random number between
            // 0 to AlphaNumericString variable length
            int index
                    = (int)(AlphaNumericString.length()
                    * Math.random());

            // add Character one by one in end of sb
            password.append(AlphaNumericString
                    .charAt(index));
        }

        return password.toString();
    }

}
