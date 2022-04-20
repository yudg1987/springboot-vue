package com.dgyu.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.dgyu.entity.Book;
import com.dgyu.mapper.BookDao;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;

import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@Api(value = "书籍管理相关接口", tags = "书籍管理相关接口类")
@RestController
@RequestMapping("/book")
@Slf4j
public class BookController {

	@Resource
	private BookDao bookDao;

	@GetMapping("/getBooks/{page}/{size}")
	@ApiOperation("分页查询书籍")
	public IPage<Book> getBooks(@PathVariable("page") int page, @PathVariable("size") int size) {
		log.debug("getBooks start ,page:{},size:{}", page, size);
		// PageHelper.startPage(page, size);
		IPage<Book> bookPage = new Page<>(page, size);// 参数一是当前页，参数二是每页个数
		bookPage = bookDao.selectPage(bookPage, null);
		// List<Book> books = bookDao.findBooks();
		// PageInfo pageInfo = new PageInfo(books);
		return bookPage;
	}

	@ApiOperation("添加书籍")
	@PostMapping("/addBook")
	public Boolean addBook(@RequestBody Book book) {
		bookDao.insert(book);
		return true;
	}

	@GetMapping("/getBookById/{id}")
	@ApiOperation("根据ID查询书籍")
	public Book getBookById(@PathVariable("id") int id) {
		// Book book = bookDao.selectByPrimaryKey(id);
		Book book = bookDao.selectById(id);
		return book;
	}

	@PostMapping("/updateBook")
	@ApiOperation("根据ID更新书籍")
	public Boolean updateBook(@RequestBody Book book) {
		// bookDao.updateByPrimaryKey(book);

		bookDao.updateById(book);
		return true;
	}

	@DeleteMapping("/delete/{id}")
	@ApiOperation("根据ID删除书籍")
	public Boolean updateBook(@PathVariable("id") Integer id) {
		// bookDao.deleteByPrimaryKey(id);

		bookDao.deleteById(id);
		return true;
	}
}
