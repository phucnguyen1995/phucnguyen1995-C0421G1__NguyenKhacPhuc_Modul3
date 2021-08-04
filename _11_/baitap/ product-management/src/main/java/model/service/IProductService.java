package model.service;

import model.bean.Product;

import java.util.List;

public interface IProductService {
    List<Product> findAll();

    void save(Product product);

    Product findById(int id);

    void update(int id,Product product);

    void remove(int id);


//    Hiển thị danh sách sản phẩm
//    Tạo sản phẩm mới
//    Cập nhật thông tin sản phẩm
//    Xoá một sản phẩm
//    Xem chi tiết một sản phẩm
//    Tìm kiếm sản phẩm theo tên
//
//    Hiển thị danh sách khách hàng
//    Thêm một khách hàng mới
//    Sửa đổi thông tin của khách hàng
//    Xoá một khách hàng
//    Xem thông tin chi tiết của khách hàng
}
