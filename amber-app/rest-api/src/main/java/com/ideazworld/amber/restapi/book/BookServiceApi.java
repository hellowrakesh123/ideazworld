package com.ideazworld.amber.restapi.book;

import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amber.ideazworld.schema.beans.book.Book;
import com.amber.ideazworld.schema.beans.core.SearchRequest;
import com.ideazworld.amber.restapi.AbstractRefServiceApi;
import com.ideazworld.amber.service.book.BookService;

@Path("/books")
@Service
public class BookServiceApi extends AbstractRefServiceApi<Book, com.ideazworld.amber.dao.entity.book.Book, Integer, BookService> {

	@Autowired
	public BookServiceApi(BookService service) {
		super("book", service);
	}
	
	@POST
	@Path("search")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public List<Book> save(SearchRequest searchRequest) {
		return service.search(searchRequest);
	}
}
