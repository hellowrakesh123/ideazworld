package com.ideazworld.amber.service.book;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amber.ideazworld.schema.beans.book.Book;
import com.ideazworld.amber.converter.book.BookConverter;
import com.ideazworld.amber.dao.repository.book.BookRepository;
import com.ideazworld.amber.service.AbstractRefPersistenceService;

@Service
public class BookServiceImpl extends AbstractRefPersistenceService<Book, BookConverter, com.ideazworld.amber.dao.entity.book.Book, Integer, BookRepository> implements BookService {

	@Autowired
	public BookServiceImpl(BookConverter converter, BookRepository repository) {
		super(converter, repository);
	}
}
