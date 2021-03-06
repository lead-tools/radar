﻿
&НаКлиенте
Процедура ОбработкаКоманды(ПараметрКоманды, ПараметрыВыполненияКоманды)
	
	ВыполнитьАнализНаСервере(ПараметрКоманды);
	ОповеститьОбИзменении(Тип("ДокументСсылка.Радар_Отчет"));
	
КонецПроцедуры

&НаСервере
Процедура ВыполнитьАнализНаСервере(Проект)
		
	ОбъектОтчета = Документы.Радар_Отчет.СоздатьДокумент();
	ОбъектОтчета.Проект = Проект;
	ОбъектОтчета.УстановитьНовыйНомер();
	ОбъектОтчета.Дата = ПолучитьОперативнуюОтметкуВремени();
	ОбъектОтчета.ОбменДанными.Загрузка = Истина;
	ОбъектОтчета.Записать(РежимЗаписиДокумента.Запись);
	
КонецПроцедуры