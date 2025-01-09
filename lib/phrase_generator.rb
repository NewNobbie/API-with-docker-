
# Subjects
SUBJECTS =  ["El perro", "La tortuga", "Mi amigo", "El Sebas", "El gato", "El Miguel"]

# Predicate
PREDICATES = ["corre rápido", "es muy sabio", "ama programar", "canta muy
mal", "baila muy bien", "coce rápido"]

def select_subject
    SUBJECTS.sample
end    

def select_predicate
    PREDICATES.sample
end    

def mix
    subject = select_subject
    predicate = select_predicate

    if subject.length > 8
        phrase = "#{subject} intelligent #{predicate}"
    elsif predicate.include?("program")
        phrase = "#{subject} #{predicate}!"
    else
        phrase = "#{subject} #{predicate}"         
    end
    
    phrase
end    

puts mix