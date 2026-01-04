package dao;

import model.ProductImage;

import java.util.List;

public class ImageDao extends BaseDao {
    public List<ProductImage> getAllImageByProductId(int productId) {
        String sql = "select Image_Id, Product_Id, Image_Url from product_images where Product_Id = :productId order by Image_Url ASC" ;

        return getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                      .bind("productId", productId)
                      .mapToBean(ProductImage.class)
                      .list()
        );
    }
}
