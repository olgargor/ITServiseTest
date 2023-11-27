          
&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	Если  Параметры.Свойство("Склад") Тогда
	    Список.Параметры.УстановитьЗначениеПараметра("Склад",Параметры.Склад);	
	КонецЕсли;
	
	ЕстьОстатки=Истина; 
	ЭлементОтбора = Список.КомпоновщикНастроек.ФиксированныеНастройки.Отбор.Элементы.Добавить(Тип("ЭлементОтбораКомпоновкиДанных"));
	ЭлементОтбора.ЛевоеЗначение = Новый ПолеКомпоновкиДанных("КоличествоОстаток");
	ЭлементОтбора.ВидСравнения = ВидСравненияКомпоновкиДанных.Больше;
	ЭлементОтбора.ПравоеЗначение = 0;
КонецПроцедуры

&НаСервере
Процедура УстановитьСнятьОтборПоКоличеству()
	Если  ЕстьОстатки Тогда
		ЭлементОтбора = Список.КомпоновщикНастроек.ФиксированныеНастройки.Отбор.Элементы.Добавить(Тип("ЭлементОтбораКомпоновкиДанных"));
		ЭлементОтбора.ЛевоеЗначение = Новый ПолеКомпоновкиДанных("КоличествоОстаток");
	    ЭлементОтбора.ВидСравнения = ВидСравненияКомпоновкиДанных.Больше;
		ЭлементОтбора.ПравоеЗначение = 0;  
	Иначе           
		//т.к. других отборов у нас нет, то можно не париться с выбором конкретного
		//просто очистим все отборы
		Список.КомпоновщикНастроек.ФиксированныеНастройки.Отбор.Элементы.Очистить();	
	КонецЕсли;  		
КонецПроцедуры


&НаКлиенте
Процедура ЕстьОстаткиПриИзменении(Элемент)
	УстановитьСнятьОтборПоКоличеству()
КонецПроцедуры

&НаКлиенте
Процедура СписокВыбор(Элемент, ВыбраннаяСтрока, Поле, СтандартнаяОбработка) 
	СтандартнаяОбработка = Ложь;
	ОповеститьОВыборе(ВыбраннаяСтрока);
КонецПроцедуры


   




