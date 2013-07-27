package com.ideazworld.amber.converter.book;

import org.dozer.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.amber.ideazworld.schema.beans.book.Book;
import com.ideazworld.amber.converter.AbstractRefConverter;

@Component
public class BookConverter extends AbstractRefConverter<Book, com.ideazworld.amber.dao.entity.book.Book> {

	@Autowired
	public BookConverter(Mapper mapper) {
		super(mapper, Book.class, com.ideazworld.amber.dao.entity.book.Book.class);
	}
}
