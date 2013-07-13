--This script contains the type data for amber schema.

--tags seed data
INSERT INTO `tag` (`id`, `name`) VALUES (1, 'electronics');
INSERT INTO `tag` (`id`, `name`) VALUES (2, 'algorithms');
INSERT INTO `tag` (`id`, `name`) VALUES (3, 'compiler');

--metadata for category
INSERT INTO `metadata` (`id`, `name`, `description`, `type`) VALUES (1, 'Engineering', 'Contains engineering books.', 'CATEGORY');
INSERT INTO `metadata` (`id`, `name`, `description`, `type`) VALUES (2, 'Science', 'Contains science books.', 'CATEGORY');
INSERT INTO `metadata` (`id`, `name`, `description`, `type`) VALUES (3, 'Mathematics', 'Contains mathematics books.', 'CATEGORY');

--metadata for sub-category
INSERT INTO `metadata` (`id`, `name`, `description`, `type`) VALUES (4, 'Computer Engineering', 'Contains computer engineering books.', 'SUB_CATEGORY');
INSERT INTO `metadata` (`id`, `name`, `description`, `type`) VALUES (5, 'Electronics Engineering', 'Contains electronics engineering books.', 'SUB_CATEGORY');
INSERT INTO `metadata` (`id`, `name`, `description`, `type`) VALUES (6, 'Elemectrical Engineering', 'Contains electrical engineering books.', 'SUB_CATEGORY');
INSERT INTO `metadata` (`id`, `name`, `description`, `type`) VALUES (7, 'Physics', 'Contains physics books.', 'SUB_CATEGORY');
INSERT INTO `metadata` (`id`, `name`, `description`, `type`) VALUES (8, 'Chemistry', 'Contains chemistry books.', 'SUB_CATEGORY');
INSERT INTO `metadata` (`id`, `name`, `description`, `type`) VALUES (9, 'Biology', 'Contains biology books.', 'SUB_CATEGORY');
INSERT INTO `metadata` (`id`, `name`, `description`, `type`) VALUES (10, 'Arthemetics', 'Contains arthematics books.', 'SUB_CATEGORY');
INSERT INTO `metadata` (`id`, `name`, `description`, `type`) VALUES (11, 'Trigonometry', 'Contains trigonometry books.', 'SUB_CATEGORY');
INSERT INTO `metadata` (`id`, `name`, `description`, `type`) VALUES (12, 'Alzebra', 'Contains alzebra books.', 'SUB_CATEGORY');