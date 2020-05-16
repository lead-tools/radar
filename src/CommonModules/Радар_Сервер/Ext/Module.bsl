﻿
Процедура СообщитьПолеНеЗаполнено(Объект, ИмяПоля, Отказ = Неопределено, Знач СинонимПоля = Неопределено) Экспорт
	
	Если СинонимПоля = Неопределено Тогда
		СинонимПоля = Объект.Метаданные().Реквизиты[ИмяПоля].Синоним;
	КонецЕсли; 
	
	Шаблон = НСтр("ru = 'Поле ""%1"" не заполнено'");
	
	Сообщение = Новый СообщениеПользователю;
	Сообщение.УстановитьДанные(Объект);
	Сообщение.Поле = ИмяПоля;
	Сообщение.Текст = СтрШаблон(Шаблон, СинонимПоля);
	Сообщение.Сообщить();
	
	Отказ = Истина;
	
КонецПроцедуры 