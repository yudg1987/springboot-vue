package com.dgyu.controller;

import com.dgyu.entity.Book;
import com.dgyu.mapper.BookDao;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/book")
public class BookController {

    @Resource
    private BookDao bookDao;

    @GetMapping("/getBooks")
    public List<Book> getBooks() {
        return bookDao.findBooks();
    }
}
