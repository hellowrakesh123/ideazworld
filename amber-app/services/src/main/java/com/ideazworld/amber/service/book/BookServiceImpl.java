package com.ideazworld.amber.service.book;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amber.ideazworld.commons.model.ItemStatusType;
import com.amber.ideazworld.schema.beans.book.Book;
import com.amber.ideazworld.schema.beans.core.SearchRequest;
import com.amber.ideazworld.schema.beans.core.SimpleHint;
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
	
	@Override
	protected String buildSearchQuery(SearchRequest searchRequest) {
		StringBuilder preQueryBuilder = new StringBuilder("select b from com.ideazworld.amber.dao.entity.book.Book b where b.active=1");
		StringBuilder criteriaQuery = new StringBuilder();
		for (SimpleHint simpleHint : searchRequest.getSimpleHints()) {
			if(simpleHint.getKey().equals("search-hint")) {
				criteriaQuery.append("b.name LIKE '%" + simpleHint.getValue() + "%'");
				criteriaQuery.append(" OR b.description LIKE '%" + simpleHint.getValue() + "%'");
			}
		}
		preQueryBuilder.append(" AND (").append(criteriaQuery.toString()).append(")");
		return preQueryBuilder.toString();
	}
}