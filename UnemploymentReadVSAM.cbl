      *****************************************************************
      * Program name:    UNEMREAD
      * Original author: DAVID QUINTERO
      *
      * Maintenence Log
      * Date      Author        Maintenance Requirement
      * --------- ------------  ---------------------------------------
      * 05/05/20 DAVID QUINTERO  Created for COBOL class
      *
      *****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID.  UNEMREAD.
       AUTHOR. DAVID QUINTERO.
       INSTALLATION. COBOL DEVELOPMENT CENTER.
       DATE-WRITTEN. 05/05/20.
       DATE-COMPILED. 05/05/20.
       SECURITY. NON-CONFIDENTIAL.
      *****************************************************************
      *****************************************************************
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER. IBM-3081.
       OBJECT-COMPUTER. IBM-3081.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT Unemployment-Claims-File ASSIGN TO UNDD
             ORGANIZATION IS INDEXED
             ACCESS MODE  IS DYNAMIC
             RECORD KEY   IS Record-ID OF Unemployment-Claim
             FILE STATUS  IS Unemployment-File-Status.
      *****************************************************************
      *****************************************************************
       DATA DIVISION.
       FILE SECTION.
       FD  Unemployment-Claims-File
            DATA RECORD IS Unemployment-Claim.
            COPY UNEMC.
      **
      **
       WORKING-STORAGE SECTION.
       01  Unemployment-File-Status              PIC 99.
           88 Unemployment-File-Ok               VALUE 00.
           88 May-exist                          VALUE 35.
       01  EOF-Switch                PIC X.
           88 EOF                    VALUE 'Y'.
      *****************************************************************
      *****************************************************************
       LINKAGE SECTION.
       COPY UNEMT.
      ****************************************************************
      ****************************************************************
       PROCEDURE DIVISION USING Record-Table-Size, Record-Table-Index,
           Program-Action, Record-Table.
      *
           OPEN I-O Unemployment-Claims-File
      *
           IF Unemployment-File-Ok
              EVALUATE Program-Action
                  WHEN 'ALL'
                      PERFORM Write-All-Record UNTIL EOF
      *
                  WHEN OTHER
      *
                      MOVE Record-ID OF
                            TBL-Unemployment-Claim (Record-Table-Size)
                            TO Record-ID OF Unemployment-Claim
                      PERFORM Write-Record
      *
              END-EVALUATE
      *
           ELSE
              MOVE 0 TO Record-Table-Size
              DISPLAY 'File error: ', Unemployment-File-Status
      *
           END-IF
      *
           CLOSE Unemployment-Claims-File
           GOBACK.
      *
      *
       Write-All-Record.
           READ Unemployment-Claims-File NEXT RECORD
               AT END
                  SET EOF TO TRUE
               NOT AT END
                   ADD 1 TO Record-Table-Size
                   MOVE Unemployment-Claim TO
                       TBL-Unemployment-Claim (Record-Table-Size)
           END-READ.
      *
      *
       Write-Record.
           READ Unemployment-Claims-File
                INVALID KEY
                   DISPLAY 'KEY INPUT WAS INVALID'
                   MOVE 0 TO Record-Table-Size
                NOT INVALID KEY
                   MOVE Unemployment-Claim TO
                       TBL-Unemployment-Claim (Record-Table-Size)
           END-READ.

