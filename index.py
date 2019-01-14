# Function to convert user question into clips form
def parse_input_to_string():
	user_input = raw_input("Enter your question : ")
	words_list = user_input.lower().split()
	final_string = ""
	for word in words_list :
		final_string += '"' + word +'"' 
	return final_string 
# importing clips library
import clips
# get input from user and store it in a variable called user_input
user_input = parse_input_to_string();
# build a global variable using clips library called Final_answer to store final answer inside it
Final_answer = clips.BuildGlobal('Final_answer','sorry, i have no answers for you at this moment.')
# load clips file 
clips.BatchStar("algorithm.clp")
# reset clips environment 
clips.Reset()
# add new fact using assert with user inputs
clips.Assert('(User_input'+user_input+')')
# run the program
clips.Run()
# print out the final answer
print "Phronesis said : " + Final_answer.Value
# t = clips.StdoutStream.Read()
# print t