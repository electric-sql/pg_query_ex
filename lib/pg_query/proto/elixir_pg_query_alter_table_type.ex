# credo:disable-for-this-file
defmodule PgQuery.AlterTableType do
  @moduledoc false
  (
    defstruct []

    (
      @spec default() :: :ALTER_TABLE_TYPE_UNDEFINED
      def default() do
        :ALTER_TABLE_TYPE_UNDEFINED
      end
    )

    @spec encode(atom() | String.t()) :: integer() | atom()
    [
      (
        def encode(:ALTER_TABLE_TYPE_UNDEFINED) do
          0
        end

        def encode("ALTER_TABLE_TYPE_UNDEFINED") do
          0
        end
      ),
      (
        def encode(:AT_AddColumn) do
          1
        end

        def encode("AT_AddColumn") do
          1
        end
      ),
      (
        def encode(:AT_AddColumnRecurse) do
          2
        end

        def encode("AT_AddColumnRecurse") do
          2
        end
      ),
      (
        def encode(:AT_AddColumnToView) do
          3
        end

        def encode("AT_AddColumnToView") do
          3
        end
      ),
      (
        def encode(:AT_ColumnDefault) do
          4
        end

        def encode("AT_ColumnDefault") do
          4
        end
      ),
      (
        def encode(:AT_CookedColumnDefault) do
          5
        end

        def encode("AT_CookedColumnDefault") do
          5
        end
      ),
      (
        def encode(:AT_DropNotNull) do
          6
        end

        def encode("AT_DropNotNull") do
          6
        end
      ),
      (
        def encode(:AT_SetNotNull) do
          7
        end

        def encode("AT_SetNotNull") do
          7
        end
      ),
      (
        def encode(:AT_DropExpression) do
          8
        end

        def encode("AT_DropExpression") do
          8
        end
      ),
      (
        def encode(:AT_CheckNotNull) do
          9
        end

        def encode("AT_CheckNotNull") do
          9
        end
      ),
      (
        def encode(:AT_SetStatistics) do
          10
        end

        def encode("AT_SetStatistics") do
          10
        end
      ),
      (
        def encode(:AT_SetOptions) do
          11
        end

        def encode("AT_SetOptions") do
          11
        end
      ),
      (
        def encode(:AT_ResetOptions) do
          12
        end

        def encode("AT_ResetOptions") do
          12
        end
      ),
      (
        def encode(:AT_SetStorage) do
          13
        end

        def encode("AT_SetStorage") do
          13
        end
      ),
      (
        def encode(:AT_SetCompression) do
          14
        end

        def encode("AT_SetCompression") do
          14
        end
      ),
      (
        def encode(:AT_DropColumn) do
          15
        end

        def encode("AT_DropColumn") do
          15
        end
      ),
      (
        def encode(:AT_DropColumnRecurse) do
          16
        end

        def encode("AT_DropColumnRecurse") do
          16
        end
      ),
      (
        def encode(:AT_AddIndex) do
          17
        end

        def encode("AT_AddIndex") do
          17
        end
      ),
      (
        def encode(:AT_ReAddIndex) do
          18
        end

        def encode("AT_ReAddIndex") do
          18
        end
      ),
      (
        def encode(:AT_AddConstraint) do
          19
        end

        def encode("AT_AddConstraint") do
          19
        end
      ),
      (
        def encode(:AT_AddConstraintRecurse) do
          20
        end

        def encode("AT_AddConstraintRecurse") do
          20
        end
      ),
      (
        def encode(:AT_ReAddConstraint) do
          21
        end

        def encode("AT_ReAddConstraint") do
          21
        end
      ),
      (
        def encode(:AT_ReAddDomainConstraint) do
          22
        end

        def encode("AT_ReAddDomainConstraint") do
          22
        end
      ),
      (
        def encode(:AT_AlterConstraint) do
          23
        end

        def encode("AT_AlterConstraint") do
          23
        end
      ),
      (
        def encode(:AT_ValidateConstraint) do
          24
        end

        def encode("AT_ValidateConstraint") do
          24
        end
      ),
      (
        def encode(:AT_ValidateConstraintRecurse) do
          25
        end

        def encode("AT_ValidateConstraintRecurse") do
          25
        end
      ),
      (
        def encode(:AT_AddIndexConstraint) do
          26
        end

        def encode("AT_AddIndexConstraint") do
          26
        end
      ),
      (
        def encode(:AT_DropConstraint) do
          27
        end

        def encode("AT_DropConstraint") do
          27
        end
      ),
      (
        def encode(:AT_DropConstraintRecurse) do
          28
        end

        def encode("AT_DropConstraintRecurse") do
          28
        end
      ),
      (
        def encode(:AT_ReAddComment) do
          29
        end

        def encode("AT_ReAddComment") do
          29
        end
      ),
      (
        def encode(:AT_AlterColumnType) do
          30
        end

        def encode("AT_AlterColumnType") do
          30
        end
      ),
      (
        def encode(:AT_AlterColumnGenericOptions) do
          31
        end

        def encode("AT_AlterColumnGenericOptions") do
          31
        end
      ),
      (
        def encode(:AT_ChangeOwner) do
          32
        end

        def encode("AT_ChangeOwner") do
          32
        end
      ),
      (
        def encode(:AT_ClusterOn) do
          33
        end

        def encode("AT_ClusterOn") do
          33
        end
      ),
      (
        def encode(:AT_DropCluster) do
          34
        end

        def encode("AT_DropCluster") do
          34
        end
      ),
      (
        def encode(:AT_SetLogged) do
          35
        end

        def encode("AT_SetLogged") do
          35
        end
      ),
      (
        def encode(:AT_SetUnLogged) do
          36
        end

        def encode("AT_SetUnLogged") do
          36
        end
      ),
      (
        def encode(:AT_DropOids) do
          37
        end

        def encode("AT_DropOids") do
          37
        end
      ),
      (
        def encode(:AT_SetAccessMethod) do
          38
        end

        def encode("AT_SetAccessMethod") do
          38
        end
      ),
      (
        def encode(:AT_SetTableSpace) do
          39
        end

        def encode("AT_SetTableSpace") do
          39
        end
      ),
      (
        def encode(:AT_SetRelOptions) do
          40
        end

        def encode("AT_SetRelOptions") do
          40
        end
      ),
      (
        def encode(:AT_ResetRelOptions) do
          41
        end

        def encode("AT_ResetRelOptions") do
          41
        end
      ),
      (
        def encode(:AT_ReplaceRelOptions) do
          42
        end

        def encode("AT_ReplaceRelOptions") do
          42
        end
      ),
      (
        def encode(:AT_EnableTrig) do
          43
        end

        def encode("AT_EnableTrig") do
          43
        end
      ),
      (
        def encode(:AT_EnableAlwaysTrig) do
          44
        end

        def encode("AT_EnableAlwaysTrig") do
          44
        end
      ),
      (
        def encode(:AT_EnableReplicaTrig) do
          45
        end

        def encode("AT_EnableReplicaTrig") do
          45
        end
      ),
      (
        def encode(:AT_DisableTrig) do
          46
        end

        def encode("AT_DisableTrig") do
          46
        end
      ),
      (
        def encode(:AT_EnableTrigAll) do
          47
        end

        def encode("AT_EnableTrigAll") do
          47
        end
      ),
      (
        def encode(:AT_DisableTrigAll) do
          48
        end

        def encode("AT_DisableTrigAll") do
          48
        end
      ),
      (
        def encode(:AT_EnableTrigUser) do
          49
        end

        def encode("AT_EnableTrigUser") do
          49
        end
      ),
      (
        def encode(:AT_DisableTrigUser) do
          50
        end

        def encode("AT_DisableTrigUser") do
          50
        end
      ),
      (
        def encode(:AT_EnableRule) do
          51
        end

        def encode("AT_EnableRule") do
          51
        end
      ),
      (
        def encode(:AT_EnableAlwaysRule) do
          52
        end

        def encode("AT_EnableAlwaysRule") do
          52
        end
      ),
      (
        def encode(:AT_EnableReplicaRule) do
          53
        end

        def encode("AT_EnableReplicaRule") do
          53
        end
      ),
      (
        def encode(:AT_DisableRule) do
          54
        end

        def encode("AT_DisableRule") do
          54
        end
      ),
      (
        def encode(:AT_AddInherit) do
          55
        end

        def encode("AT_AddInherit") do
          55
        end
      ),
      (
        def encode(:AT_DropInherit) do
          56
        end

        def encode("AT_DropInherit") do
          56
        end
      ),
      (
        def encode(:AT_AddOf) do
          57
        end

        def encode("AT_AddOf") do
          57
        end
      ),
      (
        def encode(:AT_DropOf) do
          58
        end

        def encode("AT_DropOf") do
          58
        end
      ),
      (
        def encode(:AT_ReplicaIdentity) do
          59
        end

        def encode("AT_ReplicaIdentity") do
          59
        end
      ),
      (
        def encode(:AT_EnableRowSecurity) do
          60
        end

        def encode("AT_EnableRowSecurity") do
          60
        end
      ),
      (
        def encode(:AT_DisableRowSecurity) do
          61
        end

        def encode("AT_DisableRowSecurity") do
          61
        end
      ),
      (
        def encode(:AT_ForceRowSecurity) do
          62
        end

        def encode("AT_ForceRowSecurity") do
          62
        end
      ),
      (
        def encode(:AT_NoForceRowSecurity) do
          63
        end

        def encode("AT_NoForceRowSecurity") do
          63
        end
      ),
      (
        def encode(:AT_GenericOptions) do
          64
        end

        def encode("AT_GenericOptions") do
          64
        end
      ),
      (
        def encode(:AT_AttachPartition) do
          65
        end

        def encode("AT_AttachPartition") do
          65
        end
      ),
      (
        def encode(:AT_DetachPartition) do
          66
        end

        def encode("AT_DetachPartition") do
          66
        end
      ),
      (
        def encode(:AT_DetachPartitionFinalize) do
          67
        end

        def encode("AT_DetachPartitionFinalize") do
          67
        end
      ),
      (
        def encode(:AT_AddIdentity) do
          68
        end

        def encode("AT_AddIdentity") do
          68
        end
      ),
      (
        def encode(:AT_SetIdentity) do
          69
        end

        def encode("AT_SetIdentity") do
          69
        end
      ),
      (
        def encode(:AT_DropIdentity) do
          70
        end

        def encode("AT_DropIdentity") do
          70
        end
      ),
      (
        def encode(:AT_ReAddStatistics) do
          71
        end

        def encode("AT_ReAddStatistics") do
          71
        end
      )
    ]

    def encode(x) do
      x
    end

    @spec decode(integer()) :: atom() | integer()
    [
      def decode(16) do
        :AT_DropColumnRecurse
      end,
      def decode(18) do
        :AT_ReAddIndex
      end,
      def decode(54) do
        :AT_DisableRule
      end,
      def decode(5) do
        :AT_CookedColumnDefault
      end,
      def decode(65) do
        :AT_AttachPartition
      end,
      def decode(67) do
        :AT_DetachPartitionFinalize
      end,
      def decode(19) do
        :AT_AddConstraint
      end,
      def decode(42) do
        :AT_ReplaceRelOptions
      end,
      def decode(27) do
        :AT_DropConstraint
      end,
      def decode(49) do
        :AT_EnableTrigUser
      end,
      def decode(62) do
        :AT_ForceRowSecurity
      end,
      def decode(56) do
        :AT_DropInherit
      end,
      def decode(70) do
        :AT_DropIdentity
      end,
      def decode(35) do
        :AT_SetLogged
      end,
      def decode(10) do
        :AT_SetStatistics
      end,
      def decode(24) do
        :AT_ValidateConstraint
      end,
      def decode(66) do
        :AT_DetachPartition
      end,
      def decode(50) do
        :AT_DisableTrigUser
      end,
      def decode(53) do
        :AT_EnableReplicaRule
      end,
      def decode(36) do
        :AT_SetUnLogged
      end,
      def decode(4) do
        :AT_ColumnDefault
      end,
      def decode(21) do
        :AT_ReAddConstraint
      end,
      def decode(52) do
        :AT_EnableAlwaysRule
      end,
      def decode(22) do
        :AT_ReAddDomainConstraint
      end,
      def decode(17) do
        :AT_AddIndex
      end,
      def decode(55) do
        :AT_AddInherit
      end,
      def decode(58) do
        :AT_DropOf
      end,
      def decode(3) do
        :AT_AddColumnToView
      end,
      def decode(8) do
        :AT_DropExpression
      end,
      def decode(1) do
        :AT_AddColumn
      end,
      def decode(7) do
        :AT_SetNotNull
      end,
      def decode(2) do
        :AT_AddColumnRecurse
      end,
      def decode(60) do
        :AT_EnableRowSecurity
      end,
      def decode(14) do
        :AT_SetCompression
      end,
      def decode(15) do
        :AT_DropColumn
      end,
      def decode(20) do
        :AT_AddConstraintRecurse
      end,
      def decode(41) do
        :AT_ResetRelOptions
      end,
      def decode(40) do
        :AT_SetRelOptions
      end,
      def decode(59) do
        :AT_ReplicaIdentity
      end,
      def decode(13) do
        :AT_SetStorage
      end,
      def decode(38) do
        :AT_SetAccessMethod
      end,
      def decode(51) do
        :AT_EnableRule
      end,
      def decode(68) do
        :AT_AddIdentity
      end,
      def decode(0) do
        :ALTER_TABLE_TYPE_UNDEFINED
      end,
      def decode(6) do
        :AT_DropNotNull
      end,
      def decode(64) do
        :AT_GenericOptions
      end,
      def decode(28) do
        :AT_DropConstraintRecurse
      end,
      def decode(25) do
        :AT_ValidateConstraintRecurse
      end,
      def decode(34) do
        :AT_DropCluster
      end,
      def decode(32) do
        :AT_ChangeOwner
      end,
      def decode(9) do
        :AT_CheckNotNull
      end,
      def decode(37) do
        :AT_DropOids
      end,
      def decode(11) do
        :AT_SetOptions
      end,
      def decode(31) do
        :AT_AlterColumnGenericOptions
      end,
      def decode(46) do
        :AT_DisableTrig
      end,
      def decode(71) do
        :AT_ReAddStatistics
      end,
      def decode(63) do
        :AT_NoForceRowSecurity
      end,
      def decode(69) do
        :AT_SetIdentity
      end,
      def decode(26) do
        :AT_AddIndexConstraint
      end,
      def decode(57) do
        :AT_AddOf
      end,
      def decode(48) do
        :AT_DisableTrigAll
      end,
      def decode(45) do
        :AT_EnableReplicaTrig
      end,
      def decode(39) do
        :AT_SetTableSpace
      end,
      def decode(43) do
        :AT_EnableTrig
      end,
      def decode(30) do
        :AT_AlterColumnType
      end,
      def decode(61) do
        :AT_DisableRowSecurity
      end,
      def decode(47) do
        :AT_EnableTrigAll
      end,
      def decode(29) do
        :AT_ReAddComment
      end,
      def decode(23) do
        :AT_AlterConstraint
      end,
      def decode(44) do
        :AT_EnableAlwaysTrig
      end,
      def decode(12) do
        :AT_ResetOptions
      end,
      def decode(33) do
        :AT_ClusterOn
      end
    ]

    def decode(x) do
      x
    end

    @spec constants() :: [{integer(), atom()}]
    def constants() do
      [
        {0, :ALTER_TABLE_TYPE_UNDEFINED},
        {1, :AT_AddColumn},
        {2, :AT_AddColumnRecurse},
        {3, :AT_AddColumnToView},
        {4, :AT_ColumnDefault},
        {5, :AT_CookedColumnDefault},
        {6, :AT_DropNotNull},
        {7, :AT_SetNotNull},
        {8, :AT_DropExpression},
        {9, :AT_CheckNotNull},
        {10, :AT_SetStatistics},
        {11, :AT_SetOptions},
        {12, :AT_ResetOptions},
        {13, :AT_SetStorage},
        {14, :AT_SetCompression},
        {15, :AT_DropColumn},
        {16, :AT_DropColumnRecurse},
        {17, :AT_AddIndex},
        {18, :AT_ReAddIndex},
        {19, :AT_AddConstraint},
        {20, :AT_AddConstraintRecurse},
        {21, :AT_ReAddConstraint},
        {22, :AT_ReAddDomainConstraint},
        {23, :AT_AlterConstraint},
        {24, :AT_ValidateConstraint},
        {25, :AT_ValidateConstraintRecurse},
        {26, :AT_AddIndexConstraint},
        {27, :AT_DropConstraint},
        {28, :AT_DropConstraintRecurse},
        {29, :AT_ReAddComment},
        {30, :AT_AlterColumnType},
        {31, :AT_AlterColumnGenericOptions},
        {32, :AT_ChangeOwner},
        {33, :AT_ClusterOn},
        {34, :AT_DropCluster},
        {35, :AT_SetLogged},
        {36, :AT_SetUnLogged},
        {37, :AT_DropOids},
        {38, :AT_SetAccessMethod},
        {39, :AT_SetTableSpace},
        {40, :AT_SetRelOptions},
        {41, :AT_ResetRelOptions},
        {42, :AT_ReplaceRelOptions},
        {43, :AT_EnableTrig},
        {44, :AT_EnableAlwaysTrig},
        {45, :AT_EnableReplicaTrig},
        {46, :AT_DisableTrig},
        {47, :AT_EnableTrigAll},
        {48, :AT_DisableTrigAll},
        {49, :AT_EnableTrigUser},
        {50, :AT_DisableTrigUser},
        {51, :AT_EnableRule},
        {52, :AT_EnableAlwaysRule},
        {53, :AT_EnableReplicaRule},
        {54, :AT_DisableRule},
        {55, :AT_AddInherit},
        {56, :AT_DropInherit},
        {57, :AT_AddOf},
        {58, :AT_DropOf},
        {59, :AT_ReplicaIdentity},
        {60, :AT_EnableRowSecurity},
        {61, :AT_DisableRowSecurity},
        {62, :AT_ForceRowSecurity},
        {63, :AT_NoForceRowSecurity},
        {64, :AT_GenericOptions},
        {65, :AT_AttachPartition},
        {66, :AT_DetachPartition},
        {67, :AT_DetachPartitionFinalize},
        {68, :AT_AddIdentity},
        {69, :AT_SetIdentity},
        {70, :AT_DropIdentity},
        {71, :AT_ReAddStatistics}
      ]
    end

    @spec has_constant?(any()) :: boolean()
    (
      [
        def has_constant?(:ALTER_TABLE_TYPE_UNDEFINED) do
          true
        end,
        def has_constant?(:AT_AddColumn) do
          true
        end,
        def has_constant?(:AT_AddColumnRecurse) do
          true
        end,
        def has_constant?(:AT_AddColumnToView) do
          true
        end,
        def has_constant?(:AT_ColumnDefault) do
          true
        end,
        def has_constant?(:AT_CookedColumnDefault) do
          true
        end,
        def has_constant?(:AT_DropNotNull) do
          true
        end,
        def has_constant?(:AT_SetNotNull) do
          true
        end,
        def has_constant?(:AT_DropExpression) do
          true
        end,
        def has_constant?(:AT_CheckNotNull) do
          true
        end,
        def has_constant?(:AT_SetStatistics) do
          true
        end,
        def has_constant?(:AT_SetOptions) do
          true
        end,
        def has_constant?(:AT_ResetOptions) do
          true
        end,
        def has_constant?(:AT_SetStorage) do
          true
        end,
        def has_constant?(:AT_SetCompression) do
          true
        end,
        def has_constant?(:AT_DropColumn) do
          true
        end,
        def has_constant?(:AT_DropColumnRecurse) do
          true
        end,
        def has_constant?(:AT_AddIndex) do
          true
        end,
        def has_constant?(:AT_ReAddIndex) do
          true
        end,
        def has_constant?(:AT_AddConstraint) do
          true
        end,
        def has_constant?(:AT_AddConstraintRecurse) do
          true
        end,
        def has_constant?(:AT_ReAddConstraint) do
          true
        end,
        def has_constant?(:AT_ReAddDomainConstraint) do
          true
        end,
        def has_constant?(:AT_AlterConstraint) do
          true
        end,
        def has_constant?(:AT_ValidateConstraint) do
          true
        end,
        def has_constant?(:AT_ValidateConstraintRecurse) do
          true
        end,
        def has_constant?(:AT_AddIndexConstraint) do
          true
        end,
        def has_constant?(:AT_DropConstraint) do
          true
        end,
        def has_constant?(:AT_DropConstraintRecurse) do
          true
        end,
        def has_constant?(:AT_ReAddComment) do
          true
        end,
        def has_constant?(:AT_AlterColumnType) do
          true
        end,
        def has_constant?(:AT_AlterColumnGenericOptions) do
          true
        end,
        def has_constant?(:AT_ChangeOwner) do
          true
        end,
        def has_constant?(:AT_ClusterOn) do
          true
        end,
        def has_constant?(:AT_DropCluster) do
          true
        end,
        def has_constant?(:AT_SetLogged) do
          true
        end,
        def has_constant?(:AT_SetUnLogged) do
          true
        end,
        def has_constant?(:AT_DropOids) do
          true
        end,
        def has_constant?(:AT_SetAccessMethod) do
          true
        end,
        def has_constant?(:AT_SetTableSpace) do
          true
        end,
        def has_constant?(:AT_SetRelOptions) do
          true
        end,
        def has_constant?(:AT_ResetRelOptions) do
          true
        end,
        def has_constant?(:AT_ReplaceRelOptions) do
          true
        end,
        def has_constant?(:AT_EnableTrig) do
          true
        end,
        def has_constant?(:AT_EnableAlwaysTrig) do
          true
        end,
        def has_constant?(:AT_EnableReplicaTrig) do
          true
        end,
        def has_constant?(:AT_DisableTrig) do
          true
        end,
        def has_constant?(:AT_EnableTrigAll) do
          true
        end,
        def has_constant?(:AT_DisableTrigAll) do
          true
        end,
        def has_constant?(:AT_EnableTrigUser) do
          true
        end,
        def has_constant?(:AT_DisableTrigUser) do
          true
        end,
        def has_constant?(:AT_EnableRule) do
          true
        end,
        def has_constant?(:AT_EnableAlwaysRule) do
          true
        end,
        def has_constant?(:AT_EnableReplicaRule) do
          true
        end,
        def has_constant?(:AT_DisableRule) do
          true
        end,
        def has_constant?(:AT_AddInherit) do
          true
        end,
        def has_constant?(:AT_DropInherit) do
          true
        end,
        def has_constant?(:AT_AddOf) do
          true
        end,
        def has_constant?(:AT_DropOf) do
          true
        end,
        def has_constant?(:AT_ReplicaIdentity) do
          true
        end,
        def has_constant?(:AT_EnableRowSecurity) do
          true
        end,
        def has_constant?(:AT_DisableRowSecurity) do
          true
        end,
        def has_constant?(:AT_ForceRowSecurity) do
          true
        end,
        def has_constant?(:AT_NoForceRowSecurity) do
          true
        end,
        def has_constant?(:AT_GenericOptions) do
          true
        end,
        def has_constant?(:AT_AttachPartition) do
          true
        end,
        def has_constant?(:AT_DetachPartition) do
          true
        end,
        def has_constant?(:AT_DetachPartitionFinalize) do
          true
        end,
        def has_constant?(:AT_AddIdentity) do
          true
        end,
        def has_constant?(:AT_SetIdentity) do
          true
        end,
        def has_constant?(:AT_DropIdentity) do
          true
        end,
        def has_constant?(:AT_ReAddStatistics) do
          true
        end
      ]

      def has_constant?(_) do
        false
      end
    )
  )
end
