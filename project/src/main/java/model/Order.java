package model;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.text.NumberFormat;
import java.util.Locale;
import java.math.BigDecimal;

public class Order {

    private int orderId;
    private int userId;
    private int userAddressId;
    private int paymentMethodId;
    private LocalDateTime createAt;
    private String status;
    private String paymentStatus;
    private String orderCode;
    private String note;
    private BigDecimal totalPrice;


    public LocalDateTime getCreateAt() {
        return createAt;
    }
    public String getCreateAtFormatted() {
        if (createAt == null) return "";
        return createAt.format(
                DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm")
        );
    }

    public void setCreateAt(LocalDateTime createAt) {
        this.createAt = createAt;
    }
    public String getTotalPriceFormatted() {
        if (totalPrice == null) return "0đ";

        NumberFormat nf = NumberFormat.getInstance(new Locale("vi", "VN"));
        return nf.format(totalPrice) + " đ";
    }
public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getUserAddressId() {
        return userAddressId;
    }

    public void setUserAddressId(int userAddressId) {
        this.userAddressId = userAddressId;
    }

    public int getPaymentMethodId() {
        return paymentMethodId;
    }

    public void setPaymentMethodId(int paymentMethodId) {
        this.paymentMethodId = paymentMethodId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(String paymentStatus) {
        this.paymentStatus = paymentStatus;
    }

    public String getOrderCode() {
        return orderCode;
    }

    public void setOrderCode(String orderCode) {
        this.orderCode = orderCode;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
    public void setTotalPrice(BigDecimal totalPrice) {
        this.totalPrice = totalPrice;
    }
}





