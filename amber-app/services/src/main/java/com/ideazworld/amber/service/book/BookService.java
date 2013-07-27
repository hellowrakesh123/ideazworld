package com.ideazworld.amber.service.book;

import com.amber.ideazworld.schema.beans.book.Book;
import com.ideazworld.amber.service.item.ItemService;

public interface BookService extends ItemService<Book, com.ideazworld.amber.dao.entity.book.Book, Integer> {

}
