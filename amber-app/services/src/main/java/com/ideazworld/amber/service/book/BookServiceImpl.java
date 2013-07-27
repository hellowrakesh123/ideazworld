package com.ideazworld.amber.service.book;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amber.ideazworld.commons.model.ItemStatusType;
import com.amber.ideazworld.schema.beans.book.Book;
import com.ideazworld.amber.converter.book.BookConverter;
import com.ideazworld.amber.converter.core.LocationConverter;
import com.ideazworld.amber.dao.repository.book.BookRepository;
import com.ideazworld.amber.dao.repository.core.LocationRepository;
import com.ideazworld.amber.service.item.AbstractItemService;

@Service
public class BookServiceImpl extends AbstractItemService<Book, com.ideazworld.amber.dao.entity.book.Book, BookConverter, Integer, BookRepository> implements BookService {

	@Autowired
	public BookServiceImpl(BookConverter converter, BookRepository repository, LocationRepository locationRepository, LocationConverter locationConverter) {
		super(converter, repository, locationRepository, locationConverter);
	}
	
	@Override
	protected void doSave(Book item) {
		item.setStatus(ItemStatusType.NEW);
		item.setActive(true);
		super.doSave(item);
	}
}