package com.ideazworld.amber.service.book;

import com.amber.ideazworld.schema.beans.book.Book;
import com.ideazworld.amber.service.RefPersistenceService;

public interface BookService extends RefPersistenceService<Book, com.ideazworld.amber.dao.entity.book.Book, Integer> {

}
