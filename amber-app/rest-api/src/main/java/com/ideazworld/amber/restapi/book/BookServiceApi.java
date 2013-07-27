package com.ideazworld.amber.restapi.book;

import javax.ws.rs.Path;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amber.ideazworld.schema.beans.book.Book;
import com.ideazworld.amber.restapi.AbstractRefServiceApi;
import com.ideazworld.amber.service.book.BookService;

@Path("/books")
@Service
public class BookServiceApi extends AbstractRefServiceApi<Book, com.ideazworld.amber.dao.entity.book.Book, Integer, BookService> {

	@Autowired
	public BookServiceApi(BookService service) {
		super("book", service);
	}
}
