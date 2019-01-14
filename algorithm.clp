;;;------------------------------Facts--------------------------------------------
; ordered facts with all questions and answers
(deffacts local_database
    (Question "hello there" "Hello , What can I assist you with ?" )
    (Question "what is your name ?" "My name is Phronesis" )
    (Question "who are you ?" "My name is Phronesis,im a chatbot my father is hisham and my uncles are his team" )
    (Question "who is your teacher ?" "Eng/Esraa Asem" )
    (Question "who is your doctor ?" "Dr/Mohamed Kazem" )
    (Question "how can you help me ?" "I can help you with different things like
     1.answer about Ai 
     2.telling you jokes 
     3.give you a life advices  " )
    (Question "what is ai" "AI (artificial intelligence) is the simulation of human intelligence processes by machines,especially computer systems.
      These processes include learning (the acquisition of information and rules for using the information),
       reasoning (using rules to reach approximate or definite conclusions) and self-correction.
       Particular applications of AI include expert " )
    (Question "tell me a joke" "Q. What's a banana peel's favorite type of shoe? 
        A. Slippers!")

)
;;;------------------------------End-Facts--------------------------------------------
;;;------------------------------Global Variables-------------------------------------
; global variable to store questions score and get the greatest one 
(defglobal ?*Final_score* = 0)
;;;------------------------------End-Global Variables---------------------------------
;;;------------------------------Rules-------------------------------------
; main rule to handle questions and answers
(defrule main_rule
    (Question ?question ?answer)
    (User_input $?words)
=>
    (bind ?question_score 0)
    (progn$ (?word $?words)
         (if (str-index ?word ?question) then (bind ?question_score (+ ?question_score 1)) )
    )
    (if(< ?*Final_score* ?question_score)
     then 
         (bind ?*Final_score* ?question_score)
         (bind ?*Final_answer* ?answer)
    )
)

;;;------------------------------End-Rules-------------------------------------