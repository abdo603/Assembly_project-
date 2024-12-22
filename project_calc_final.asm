#make_bin#  
 
; ( A ) 
  
include emu8086.inc   
     
   
          
                        
; ( B )  
 
 
START:    MOV AX,0h   
          MOV BX,0h
          MOV CX,0h
          MOV DX,0h
     
; ( C )             
        GOTOXY 1,0     
        PRINT '-------------_ calculator project .|.  ------------_'                    
        GOTOXY 1,2                        
        PRINT '1-NOTHING/EXIT'  
        GOTOXY 1,3  
        PRINT '2-ADDITION'                                 
        GOTOXY 1,4  
        PRINT '3-SUBTRACT'  
        GOTOXY 1,5  
        PRINT '4-MULTIPLICATION'  
        GOTOXY 1,6  
        PRINT '5-DIVISION'  
        GOTOXY 1,7  
        PRINT '6-LOGICAL_AND'  
        GOTOXY 1,8  
        PRINT '7-LOGICAL_OR'  
        GOTOXY 1,9  
        PRINT '8-LOGICAL_XOR'  
    
  
; ( D )  
 
    GOTOXY 3,12                          
    PRINT 'Give First Number:  '         
    CALL SCAN_NUM                         
    MOV [0200h],CX                         
    MOV AX,CX                              
    GOTOXY 3,13                          
 
; ( E )   
    
    PRINT 'Give Second Number:  ' 
    CALL SCAN_NUM                         
    MOV [0202h],CX                       
    MOV CX,0h                            
      
; ( F )       
                   GOTOXY 2,15             
                   PRINT 'Give Choice: '  
Choices:    CALL SCAN_NUM            
     
; ( G ) 
  
GOTOXY 1,17                    
CMP CX,1h         
JE exit        
CMP CX,2h          
JE addition        
CMP CX,3h           
JE subtract          
CMP CX,4h           
JE multiplication  
CMP CX,5h           
JE division          
CMP CX,6h           
JE LOGIKO_AND       
CMP CX,7h          
JE LOGIKO_OR       
CMP CX,8h          
JE LOGIKO_XOR      
 
; ( H )  
 
JMP FALSE_A        
      
  
  
; ( I )   
  
 ; ( 1 ) 
  
exit:                                    
                      JMP end_program            
                     
          
          
 ; ( 2 ) 
           
addition:                                 
                   CALL addition_a         
                   JMP result           
addition_a:                                   
                      PRINT 'addition '   
                      ADC AX,[0202h]      
                      MOV [0204h],AX      
                      RET                   
  
 ; ( 3 )    
subtract:                                    
                   CALL subtract_a          
                   JMP result          
subtract_a:         
                      PRINT 'subtraction '     
                      SBB AX,[0202h]       
                      MOV [0204h],AX      
                      RET                  
 ; ( 4 ) 
  
multiplication:                                
                   CALL multiplication_a       
                   JMP result              
multiplication_a:    
                      PRINT 'multiplication '    
                      MOV BX,[0202h]          
                      MUL BX                  
                      MOV [0204h],AX          
                      RET                      
            
; ( 5 )            
          
division:                              
                   CALL division_a     
                   JMP result      
division_a:      
                   PRINT 'division '    
                      MOV BX,[0202h] 
                      DIV BX           
                      MOV [0204h],AX 
                      MOV [0206h],DX 
                      RET             
             
 ; ( 6 )            
             
LOGIKO_AND:                                
                   CALL LOGIKO_AND_a        
                   JMP result           
LOGIKO_AND_a:     
                      PRINT 'LOGIKO AND '    
                      AND AX,[0202h]        
                      MOV [0204h],AX     
                      RET
 ; ( 7 )            
             
LOGIKO_OR:                                    
                   CALL LOGIKO_OR_a          
                   JMP result           
LOGIKO_OR_a:    
                      PRINT 'LOGIKO OR '     
                      OR AX,[0202h]        
                      MOV [0204h],AX       
                      RET                    
           
 ; ( 8 )           
           
LOGIKO_XOR:                                 
                   CALL LOGIKO_XOR_a         
                   JMP result           
LOGIKO_XOR_a:     
                      PRINT 'LOGIKO XOR '         
                      XOR AX,[0202h]        
                      MOV [0204h],AX        
                      RET                            
; ( J ) 
             
result:         
                   PRINT '-> the result is: _-_-_-_-_-_-_-_  '  
                   CALL PRINT_NUM                       
                   PRINT '  _-_-_-_-_-_-_-_'             
                   GOTOXY 1,19                                
                   PRINT 'PRESS ANY KEY TO CONTINUE'   
                   MOV AH,0h                            
                   INT 16h                                     
                   GOTOXY 1,19                           
                   PRINT '                         '     
                   GOTOXY 1,20                          
                   PRINT 'WOULD YOU LIKE TO RUN THE PROGRAM AGAIN ?'    
                   print '     '  
                   PRINT '1=YES    2=NO'           
                   GOTOXY 1,22                    
                   PRINT 'Give Choice: '         
; ( K ) 
  
CHOOSE_FALSE_B:    
                   CALL SCAN_NUM       
                   CMP CX,1h           
                   JE AGAIN             
                   CMP CX,2h           
                   JE end_program          
                   JMP FALSE_B       
  
  
  
       
       
       
       
       
  
AGAIN:       
             CALL CLEAR_SCREEN   
             JMP START             
   
  
  
  
FALSE_A:                 
       PRINT 'THE CHOICE YOU GAVE IS NOT ACCEPTABLE '       
       GOTOXY 2,15                                          
       PRINT 'CHOOSE AGAIN: '                             
       JMP choices                                  
                                  
         
  
FALSE_B:                                                    
               GOTOXY 1,23                                       
               PRINT 'THE CHOICE YOU GAVE IS NOT ACCEPTABLE '    
               GOTOXY 1,22  
               PRINT 'GIVE ANOTHER CHOICE: '                     
               JMP CHOOSE_FALSE_B                              
     
  
  
   end_program:    
       CALL CLEAR_SCREEN                          
       GOTOXY 3,21  
       PRINT 'EXITING FROM THE PROGRAM'           
       GOTOXY 28,4                                
       PRINT 'CREDITS'                            
       GOTOXY 28,5                                
       PRINT 'NAME --> abdelrahman_emad,abdelrahman_alsayed'          
       GOTOXY 28,6                               
       PRINT 'PRESS ANY KEY TO END THE PROGRAM'
       MOV AH,0h                   
       INT 16h         
       PRINT ''  
  
HLT           
  
DEFINE_SCAN_NUM                    
DEFINE_PRINT_NUM                  
DEFINE_PRINT_NUM_UNS               
DEFINE_CLEAR_SCREEN                 
  
  
  
  
END          