﻿
Процедура ОбработкаПроверкиЗаполнения(Отказ, ПроверяемыеРеквизиты)
	
	Если ЭтотОбъект.ВнешняяКонфигурация
		И Не ЗначениеЗаполнено(ЭтотОбъект.ПутьКонфигурации) Тогда
		
		Радар_Сервер.СообщитьПолеНеЗаполнено(ЭтотОбъект, "ПутьКонфигурации", Отказ);
		
	КонецЕсли; 
	
КонецПроцедуры
