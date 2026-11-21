# Этот файл содержит конфигурацию Credo, и вы, вероятно, читаете
# это после создания его с помощью `mix credo.gen.config`.
#
# Если вы обнаружите в этом файле что-то неправильное или неясное, сообщите об этом.
# issue on GitHub: https://github.com/rrrene/credo/issues
#
%{
  #
  # Вы можете иметь столько конфигураций, сколько захотите, в поле `configs:`.
  configs: [
    %{
      #
      # Запустите любой exec, используя `mix credo -C <имя>`. Если имя исполнителя не указано
      # используется «по умолчанию».
      #
      name: "default",
      #
      # Вот файлы, включенные в анализ:
      files: %{
        #
        # Вы можете указать явные globs или просто каталоги.
        # В последнем случае будет использоваться `**/*.{ex,exs}`.
        #
        included: ["lib/", "src/", "test/", "web/", "apps/"],
        excluded: [~r"/_build/", ~r"/deps/", ~r"/node_modules/"]
      },
      #
      # Если вы создаете свои собственные проверки, вам необходимо указать исходные файлы для
      # их здесь, чтобы Credo мог загрузить их перед запуском анализа.
      #
      requires: [],
      #
      # Если вы хотите применить руководство по стилю и вам нужен более традиционный анализ
      # опыт, вы можете изменить `strict` на `true` ниже:
      #
      strict: false,
      #
      # Если вы хотите использовать неокрашенный вывод по умолчанию, вы можете изменить `color`
      # на `false` ниже:
      #
      color: true,
      #
      # Вы можете настроить параметры любой проверки, добавив второй элемент
      # в кортеж.
      #
      # Чтобы отключить проверку, укажите false в качестве второго элемента:
      #
      #     {Credo.Check.Design.DuplicatedCode, false}
      #
      checks: [
        #
        ## Проверки согласованности
        #
        {Credo.Check.Consistency.ExceptionNames},
        {Credo.Check.Consistency.LineEndings},
        {Credo.Check.Consistency.ParameterPatternMatching},
        {Credo.Check.Consistency.SpaceAroundOperators},
        {Credo.Check.Consistency.SpaceInParentheses},
        {Credo.Check.Consistency.TabsOrSpaces},

        #
        ## Проверка дизайна
        #
        # Вы можете настроить приоритет любой проверки
        # Значения приоритета: «низкий, нормальный, высокий, более высокий».
        #
        {Credo.Check.Design.AliasUsage, priority: :low},
        # Для некоторых проверок вы также можете установить другие параметры
        #
        # Если вам не нужны вызовы макросов `setup` и `test` в тестах ExUnit
        # или макрос `schema` в схемах Ecto для запуска DuplicationCode, просто
        # установите для параметра `excluded_macros` значение `[:schema, :setup, :test]`.
        #
        {Credo.Check.Design.DuplicatedCode, excluded_macros: []},
        # Вы также можете настроить статус выхода каждой проверки.
        # Если вы не хотите, чтобы комментарии TODO приводили к сбою «mix credo», просто
        # установите это значение на 0 (ноль).
        #
        {Credo.Check.Design.TagTODO, exit_status: 2},
        {Credo.Check.Design.TagFIXME},

        #
        ## Проверки читаемости
        #
        {Credo.Check.Readability.AliasOrder},
        {Credo.Check.Readability.FunctionNames},
        {Credo.Check.Readability.LargeNumbers},
        {Credo.Check.Readability.MaxLineLength, priority: :low, max_length: 130},
        {Credo.Check.Readability.ModuleAttributeNames},
        {Credo.Check.Readability.ModuleDoc},
        {Credo.Check.Readability.ModuleNames},
        {Credo.Check.Readability.ParenthesesOnZeroArityDefs},
        {Credo.Check.Readability.ParenthesesInCondition},
        {Credo.Check.Readability.PredicateFunctionNames},
        {Credo.Check.Readability.PreferImplicitTry},
        {Credo.Check.Readability.RedundantBlankLines},
        {Credo.Check.Readability.StringSigils},
        {Credo.Check.Readability.TrailingBlankLine},
        {Credo.Check.Readability.TrailingWhiteSpace},
        {Credo.Check.Readability.VariableNames},
        {Credo.Check.Readability.Semicolons},
        {Credo.Check.Readability.SpaceAfterCommas},

        #
        ## Возможности рефакторинга
        #
        {Credo.Check.Refactor.DoubleBooleanNegation},
        {Credo.Check.Refactor.CondStatements},
        {Credo.Check.Refactor.CyclomaticComplexity},
        {Credo.Check.Refactor.FunctionArity},
        {Credo.Check.Refactor.LongQuoteBlocks},
        {Credo.Check.Refactor.MapInto},
        {Credo.Check.Refactor.MatchInCondition},
        {Credo.Check.Refactor.NegatedConditionsInUnless},
        {Credo.Check.Refactor.NegatedConditionsWithElse},
        {Credo.Check.Refactor.Nesting},
        {Credo.Check.Refactor.PipeChainStart,
         excluded_argument_types: [:atom, :binary, :fn, :keyword], excluded_functions: []},
        {Credo.Check.Refactor.UnlessWithElse},

        #
        ## Предупреждения
        #
        {Credo.Check.Warning.BoolOperationOnSameValues},
        {Credo.Check.Warning.ExpensiveEmptyEnumCheck},
        {Credo.Check.Warning.IExPry},
        {Credo.Check.Warning.IoInspect},
        {Credo.Check.Warning.LazyLogging},
        {Credo.Check.Warning.OperationOnSameValues},
        {Credo.Check.Warning.OperationWithConstantResult},
        {Credo.Check.Warning.UnusedEnumOperation},
        {Credo.Check.Warning.UnusedFileOperation},
        {Credo.Check.Warning.UnusedKeywordOperation},
        {Credo.Check.Warning.UnusedListOperation},
        {Credo.Check.Warning.UnusedPathOperation},
        {Credo.Check.Warning.UnusedRegexOperation},
        {Credo.Check.Warning.UnusedStringOperation},
        {Credo.Check.Warning.UnusedTupleOperation},
        {Credo.Check.Warning.RaiseInsideRescue},

        #
        # Controversial and experimental checks (opt-in, just remove `, false`)
        #
        {Credo.Check.Refactor.ABCSize, false},
        {Credo.Check.Refactor.AppendSingleItem, false},
        {Credo.Check.Refactor.VariableRebinding, false},
        {Credo.Check.Warning.MapGetUnsafePass, false},
        {Credo.Check.Consistency.MultiAliasImportRequireUse, false},

        #
        # Устаревшие проверки (они будут удалены после льготного периода)
        #
        {Credo.Check.Readability.Specs, false}

        #
        # Пользовательские проверки можно создавать с помощью «mix credo.gen.check».
        #
      ]
    }
  ]
}
