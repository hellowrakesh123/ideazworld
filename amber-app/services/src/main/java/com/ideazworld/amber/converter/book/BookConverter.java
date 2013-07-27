package com.ideazworld.amber.converter.book;

import org.dozer.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.amber.ideazworld.commons.model.ItemType;
import com.amber.ideazworld.schema.beans.book.Book;
import com.ideazworld.amber.converter.item.ItemConverter;

@Component
public class BookConverter extends ItemConverter<Book, com.ideazworld.amber.dao.entity.book.Book> {

	@Autowired
	public BookConverter(Mapper mapper) {
		super(mapper, Book.class, com.ideazworld.amber.dao.entity.book.Book.class);
	}
	
	@Override
	public Book convertFrom(com.ideazworld.amber.dao.entity.book.Book v) {
		v.setItemType(ItemType.BOOK);
		return super.convertFrom(v);
	}
	
	@Override
	public com.ideazworld.amber.dao.entity.book.Book convertTo(Book t) {
		t.setItemType(ItemType.BOOK);
		return super.convertTo(t);
	}
}
