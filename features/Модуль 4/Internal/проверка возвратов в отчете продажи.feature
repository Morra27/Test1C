﻿#language: ru

@tree

Функционал: проверка возвратов в отчете Продажи

Как Тестировщик я хочу
проверить отображение возвратов в отчете
чтобы убедиться в верности формирования отчета Продаж

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: подготовительный сценарий
 	И экспорт основных данных
	И экспорт документов продаж, реализации и возврата
	И я выполняю код встроенного языка на сервере
		| 'Документы.SalesOrder.НайтиПоНомеру(1).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'   |
		| 'Документы.SalesInvoice.НайтиПоНомеру(1).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);' |
		| 'Документы.SalesReturn.НайтиПоНомеру(1).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'  |
	
Сценарий: создание и настройка отчета
* формирование отчета
	И В командном интерфейсе я выбираю 'Отчеты' 'D2001 Продажи'
	Тогда открылось окно 'D2001 Продажи'
	И я нажимаю на кнопку с именем 'FormChangeVariant'
	И в таблице "SettingsComposerSettings" я перехожу к строке:
		| 'Использование' | 'Структура отчета' |
		| 'Да'            | 'Характеристика'   |
	И я перехожу к закладке с именем "GroupFieldsSettings"
	И я перехожу к закладке с именем "SelectedFieldsSettingsOff"
	И я перехожу к закладке с именем "FilterSettingsOff"
	И я перехожу к закладке с именем "OrderSettingsOff"
	И я перехожу к закладке с именем "ConditionalAppearanceSettingsOff"
	И я перехожу к закладке с именем "OutputParametersSettingsOff"
	И в таблице "SettingsComposerSettings" я нажимаю на кнопку с именем 'SettingsComposerSettingsAddGroup'
	Тогда открылось окно 'Группировка'
	И я нажимаю кнопку выбора у поля с именем "Field"
	Тогда открылось окно 'Выбор поля'
	И в таблице "Source" я перехожу к строке:
		| 'Доступные поля' |
		| 'Регистратор'    |
	И я нажимаю на кнопку с именем 'Select'
	И я нажимаю на кнопку с именем 'OK'
	И я нажимаю на кнопку с именем 'FormEndEdit'
	И я нажимаю на кнопку с именем 'FormGenerate'
	И я жду когда в табличном документе "Result" заполнится ячейка "R16C1" в течение 20 секунд
	И в табличном документе 'Result' я перехожу к ячейке "R16C1"
* проверка отчета
	И табличный документ "Result" равен макету "отчетсвозвратом" по шаблону
	И я закрываю все окна клиентского приложения

	
				
	
					
		
				