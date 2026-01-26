package util;

import org.mindrot.jbcrypt.BCrypt;

public class TestBCrypt {
    public static void main(String[] args) {
        String hash = BCrypt.hashpw("123456", BCrypt.gensalt());
        System.out.println(hash);
    }
}
