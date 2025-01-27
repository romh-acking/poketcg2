DEF text EQUS "db TX_HALFWIDTH, "
DEF line EQUS "db TX_LINE, "
DEF done EQUS "db TX_END"

DEF half2full EQUS "db TX_HALF2FULL"

MACRO textfw0
	REPT _NARG
		IF STRCMP(STRSUB(\1, 1, 1), "<") == 0 && STRLEN(\1) > 1
			db \1
		ELIF STRCMP(\1, "[相手]") == 0
			db "FW0_7a", "FW0_7b", "FW0_7c"
		ELIF STRCMP(\1, "[自分]") == 0
			db "FW0_7d", "FW0_7e", "FW0_7f"
		ELSE
			FOR i, STRLEN(\1)
				db STRCAT("FW0_", STRSUB(\1, i + 1, 1))
			ENDR
		ENDC
		SHIFT
	ENDR
ENDM

MACRO textfw1
	REPT _NARG
		IF STRCMP(STRSUB(\1, 1, 1), "<") == 0 && STRLEN(\1) > 1
			db \1
		ELSE
			FOR i, STRLEN(\1)
				IF STRCMP(STRSUB(\1, i + 1, 1), " ") == 0
					db FW_SPACE
				ELSE
					db TX_FULLWIDTH1, STRCAT("FW1_", STRSUB(\1, i + 1, 1))
				ENDC
			ENDR
		ENDC
		SHIFT
	ENDR
ENDM

MACRO textfw2
	REPT _NARG
		IF STRCMP(STRSUB(\1, 1, 1), "<") == 0 && STRLEN(\1) > 1
			db \1
		ELSE
			FOR i, STRLEN(\1)
				IF STRCMP(STRSUB(\1, i + 1, 1), " ") == 0
					db FW_SPACE
				ELSE
					db TX_FULLWIDTH2, STRCAT("FW2_", STRSUB(\1, i + 1, 1))
				ENDC
			ENDR
		ENDC
		SHIFT
	ENDR
ENDM

MACRO textfw3
	REPT _NARG
		IF STRCMP(STRSUB(\1, 1, 1), "<") == 0 && STRLEN(\1) > 1
			db \1
		ELSE
			FOR i, STRLEN(\1)
				IF STRCMP(STRSUB(\1, i + 1, 1), " ") == 0
					db FW_SPACE
				ELSE
					db TX_FULLWIDTH3, STRCAT("FW3_", STRSUB(\1, i + 1, 1))
				ENDC
			ENDR
		ENDC
		SHIFT
	ENDR
ENDM

MACRO textfw4
	REPT _NARG
		IF STRCMP(STRSUB(\1, 1, 1), "<") == 0 && STRLEN(\1) > 1
			db \1
		ELSE
			FOR i, STRLEN(\1)
				IF STRCMP(STRSUB(\1, i + 1, 1), " ") == 0
					db FW_SPACE
				ELSE
					db TX_FULLWIDTH4, STRCAT("FW4_", STRSUB(\1, i + 1, 1))
				ENDC
			ENDR
		ENDC
		SHIFT
	ENDR
ENDM

MACRO katakana
	db TX_KATAKANA
	textfw0 \#
ENDM

MACRO hiragana
	db TX_HIRAGANA
	textfw0 \#
ENDM

MACRO ldfw3
	ld \1, (TX_FULLWIDTH3 << 8) | STRCAT("FW3_", \2)
ENDM
