package com.dgyu.controller;

import com.dgyu.entity.Book;
import com.dgyu.mapper.BookDao;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import lombok.extern.slf4j.Slf4j;

import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/book")
@Slf4j
public class BookController {

    @Resource
    private BookDao bookDao;

    @GetMapping("/getBooks/{page}/{size}")
    public PageInfo<List<Book>> getBooks(@PathVariable("page") int page, @PathVariable("size") int size) {
    	log.debug("getBooks start ,page:{},size:{}",page,size);
        PageHelper.startPage(page, size);
        List<Book> books = bookDao.findBooks();
        PageInfo pageInfo = new PageInfo(books);
        return pageInfo;
    }

    @PostMapping("/addBook")
    public Boolean addBook(@RequestBody Book book) {
        bookDao.insert(book);
        return true;
    }

    @GetMapping("/getBookById/{id}")
    public Book getBookById(@PathVariable("id") int id) {
        //Book book = bookDao.selectByPrimaryKey(id);
    	Book book=bookDao.selectById(id);
        return book;
    }

    @PostMapping("/updateBook")
    public Boolean updateBook(@RequestBody Book book) {
        //bookDao.updateByPrimaryKey(book);
        
        bookDao.updateById(book);
        return true;
    }

    @DeleteMapping("/delete/{id}")
    public Boolean updateBook(@PathVariable("id")Integer id) {
        //bookDao.deleteByPrimaryKey(id);
        
        bookDao.deleteById(id);
        return true;
    }
}
