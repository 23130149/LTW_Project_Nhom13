package util;

import java.math.BigDecimal;
import java.text.NumberFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Locale;

public class FormatUtil {

    private static final DateTimeFormatter DATE_TIME =
            DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm");

    public static String formatDateTime(LocalDateTime dt) {
        return dt == null ? "" : dt.format(DATE_TIME);
    }

    public static String formatMoney(BigDecimal money) {
        if (money == null) return "0đ";
        NumberFormat nf = NumberFormat.getInstance(new Locale("vi", "VN"));
        return nf.format(money) + "đ";
    }
}
