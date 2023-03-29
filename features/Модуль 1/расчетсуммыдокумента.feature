﻿#language: ru

@tree

Функционал: Проверка расчета суммы документа Заказ

Как Менеджер по продажам я хочу
создание документа Заказ
чтобы проверить сумму при изменении количества и цены   

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Расчет итоговой суммы в документе Заказ
* Открытие формы создания документа
	И я закрываю все окна клиентского приложения
	И В командном интерфейсе я выбираю 'Продажи' 'Заказы'
	Тогда открылось окно 'Заказы товаров'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Заказ (создание)'
* Заполнение шапки документа
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "Все для дома"'
	И из выпадающего списка с именем "Покупатель" я выбираю точное значение 'Магазин "Бытовая техника"'
	И из выпадающего списка с именем "Склад" я выбираю точное значение 'Малый'
	И из выпадающего списка с именем "Валюта" я выбираю точное значение 'Рубли'
* Заполнение табличной части
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
	Тогда открылось окно 'Товары'
	И в таблице "Список" я перехожу к строке:
	| 'Код'       | 'Наименование' |
	| '000000005' | 'Тапочки'      |
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Заказ (создание) *'
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '2'
	И в таблице "Товары" я завершаю редактирование строки
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
	Тогда открылось окно 'Товары'
	И в таблице "Список" я перехожу к строке:
	| 'Код'       | 'Наименование' |
	| '000000006' | 'Ботинки'      |
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Заказ (создание) *'
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '3'
	И в таблице "Товары" я завершаю редактирование строки
* Проверка заполнения табличной части
	Тогда таблица "Товары" содержит строки:
			| 'Товар'   | 'Цена'     | 'Количество' | 'Сумма'    |
			| 'Тапочки' | '700,00'   | '2'          | '1 400,00' |
			| 'Ботинки' | '2 300,00' | '3'          | '6 900,00' |
* Проверка расчета итоговой суммы
	И элемент формы с именем "ТоварыИтогСумма" стал равен '8 300'
* Проверка расчета итоговой суммы при изменении цены
	Когда открылось окно 'Заказ (создание) *'
	И в таблице "Товары" я активизирую поле с именем "ТоварыТовар"
	И в таблице "Товары" я перехожу к строке:
		| 'Количество' | 'Сумма'    | 'Товар'   | 'Цена'   |
		| '2'          | '1 400,00' | 'Тапочки' | '700,00' |
	И в таблице "Товары" я активизирую поле с именем "ТоварыЦена"
	И в таблице "Товары" я выбираю текущую строку
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '2 000,00'
	И в таблице "Товары" я завершаю редактирование строки
	И элемент формы с именем "ТоварыИтогСумма" стал равен '10 900'
* Проверка расчета итоговой суммы при изменении количества
	Когда открылось окно 'Заказ (создание) *'
	И в таблице "Товары" я активизирую поле с именем "ТоварыТовар"
	И в таблице "Товары" я выбираю текущую строку
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '1'
	И в таблице "Товары" я завершаю редактирование строки
	И элемент формы с именем "ТоварыИтогСумма" стал равен '8 900'
* Проведение документа
	И я нажимаю на кнопку с именем 'ФормаЗаписать'
	И я жду закрытия окна 'Заказ (создание) *' в течение 20 секунд

	

		
	