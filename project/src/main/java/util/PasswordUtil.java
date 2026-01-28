package util;

import org.mindrot.jbcrypt.BCrypt;

public class PasswordUtil {

    public static String hash(String plainPassword) {
        return BCrypt.hashpw(plainPassword, BCrypt.gensalt(12));
    }

    public static boolean verify(String plain, String stored) {

        // password cũ (plaintext)
        if (!stored.startsWith("$2")) {
            return plain.equals(stored);
        }

        // password mới (bcrypt)
        return BCrypt.checkpw(plain, stored);
    }

}