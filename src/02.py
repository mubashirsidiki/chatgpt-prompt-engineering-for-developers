# Set your API key
client = OpenAI()

# Create a one-shot prompt
prompt = """
     Q: Extract the odd numbers from {1, 3, 7, 12, 19}. A: Odd numbers = {1, 3, 7, 19}
     Q: Extract the odd numbers from {3, 5, 11, 12, 16}. A:
"""

response = get_response(prompt)
print(response)


# Set your API key
client = OpenAI()

response = client.chat.completions.create(
    model="gpt-3.5-turbo",
    # Provide the examples as previous conversations
    messages=[
        {"role": "user", "content": "The product quality exceeded my expectations"},
        {"role": "assistant", "content": "1"},
        {
            "role": "user",
            "content": "I had a terrible experience with this product's customer service",
        },
        {"role": "assistant", "content": "-1"},
        # Provide the text for the model to classify
        {
            "role": "user",
            "content": "The price of the product is really fair given its features",
        },
    ],
    temperature=0,
)
print(response.choices[0].message.content)


# Set your API key
client = OpenAI()

# Create a single-step prompt to get help planning the vacation
prompt = "Help me plan a beach vacation."

response = get_response(prompt)
print(response)


# Set your API key
client = OpenAI()

# Create a prompt detailing steps to plan the trip
prompt = """
     Help me plan a beach vacation.
     Step 1 - Specify four potential locations for beach vacations
     Step 2 - State some accommodation options in each
     Step 3 - State activities that could be done in each
     Step 4 - Evaluate the pros and cons for each destination
    """

response = get_response(prompt)
print(response)


# Set your API key
client = OpenAI()

code = """
def calculate_rectangle_area(length, width):
    area = length * width
    return area
"""

# Create a prompt that analyzes correctness of the code
prompt = f"""
     Analyze the correctness of the function delimited by triple backticks according to the following criteria:
      1- It should have correct syntax
      2- The function should receive only 2 inputs
      3- The function should return only one output
      ```{code}```
    """

response = get_response(prompt)
print(response)


# Set your API key
client = OpenAI()

# Create the chain-of-thought prompt
prompt = "Compute the age of my friend's father in 10 years, given that now he's double my friend's age, and my friend is 20. Give a step by step explanation."

response = get_response(prompt)
print(response)


# Set your API key
client = OpenAI()

# Define the example
example = """Q: Sum the even numbers in the following set: {9, 10, 13, 4, 2}.
             A: Even numbers: 10, 4, 2. Adding them: 10+4+2=16"""

# Define the question
question = """Q: Sum the even numbers in the following set: {15, 13, 82, 7, 14} 
             A:"""

# Create the final prompt
prompt = example + question
response = get_response(prompt)
print(response)


# Set your API key
client = OpenAI()

# Create the self_consistency instruction
self_consistency_instruction = "Imagine three completely independent experts who reason differently are answering this question. The final answer is obtained by majority vote. The question is: "

# Create the problem to solve
problem_to_solve = "If you own a store that sells laptops and mobile phones. You start your day with 50 devices in the store, out of which 60% are mobile phones. Throughout the day, three clients visited the store, each of them bought one mobile phone, and one of them bought additionally a laptop. Also, you added to your collection 10 laptops and 5 mobile phones. How many laptops and mobile phones do you have by the end of the day?"

# Create the final prompt
prompt = self_consistency_instruction + problem_to_solve

response = get_response(prompt)
print(response)


# Set your API key
client = OpenAI()

# Refine the following prompt
prompt = "Generate a table that contains the top 10 pre-trained language models, with columns for language model, release year, and owners."

response = get_response(prompt)
print(response)


# Set your API key
client = OpenAI()

# Refine the following prompt
prompt = """
Receiving a promotion at work made me feel on top of the world -> Happiness
The movie's ending left me with a heavy feeling in my chest -> Sadness
Walking alone in the dark alley sent shivers down my spine -> Fear
School begins tomorrow -> No explicit emotion
Time flies like an arrow ->
"""

response = get_response(prompt)
print(response)
