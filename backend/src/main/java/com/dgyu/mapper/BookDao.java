package com.dgyu.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
//import com.dgyu.common.BaseMapper;
import com.dgyu.entity.Book;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;

import java.util.List;

//public interface BookDao extends BaseMapper<Book> {
public interface BookDao extends BaseMapper<Book> {
	/*
	 * @Select("select * from book")
	 * 
	 * @ResultMap("BaseResultMap")
	 */
	List<Book> findBooks();

}
