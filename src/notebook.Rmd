# ChatGPT Prompt Engineering for Developers

## Introduction to Prompt Engineering Best Practices

### Creating the get_response() function

Most of the exercises in this course will call the `chat.completions`
endpoint of the OpenAI API with a user prompt. Here, you will create a
`get_response()` function that receives a prompt as input and returns
the response as an output. You will then use this function to generate a
poem about ChatGPT. In future exercises, this function will be
pre-loaded for you.

Please note that DataCamp does not store keys used in the exercises.

**Note**: Some exercises can take longer to run due to API calls and
lengthy responses.

The `OpenAI` package has been pre-loaded for you.

**Instructions**

- Set your API key to `api_key` within the `OpenAI()` class.
- Create a request to the `chat.completions` endpoint inside the
  `get_response()` function.
- Assign the `"user"` role and the content, the `prompt` parameter, for
  the message to be sent within the `get_response()` function.
- Try out the function with a prompt that asks the model to write a poem
  about ChatGPT.

**Answer**

```{python}
# Set your API key
client = OpenAI()

def get_response(prompt):
  # Create a request to the chat completions endpoint
  response = client.chat.completions.create(
    model="gpt-3.5-turbo",
    # Assign the role and content for the message
    messages=[{"role": "user", "content": prompt}], 
    temperature = 0)
  return response.choices[0].message.content

# Test the function with your prompt
response = get_response("Write a poem about ChatGPT")
print(response)
```

### Exploring prompt engineering

Prompt engineering refers to crafting effective prompts to elicit
desired responses from the language model. By refining your prompts, you
can achieve better results and guide the model towards generating more
accurate and useful responses. Your task in this exercise is to modify
the prompt you used in the previous exercise.

The `OpenAI` package and the `get_response()` function have been
pre-loaded for you.

**Instructions**

- Set your API key to `api_key` within the `OpenAI()` class.
- Craft a `prompt` that asks the model to generate a poem about ChatGPT
  while ensuring that it is written in basic English that a child can
  understand.
- Get the `response` using the `get_response()` function.

**Answer**

```{python}
# Set your API key
client = OpenAI()

# Craft a prompt that follows the instructions
prompt = "Write a poem about ChatGPT. Use basic English that a child can understand."

# Get the response
response = get_response(prompt)

print(response)
```

### Using delimited prompts with f-strings

You are a junior developer at a dynamic startup that generates content
with the help of AI. The company believes this technology can
revolutionize storytelling, and you are excited to be a part of it.
Today, your task is to generate a continuation of the provided `story`
with a delimited prompt using an f-string.

The `OpenAI` package, the `get_response()` function, and the `story`
variable have been pre-loaded for you.

**Instructions**

- Set your API key to `api_key` within the `OpenAI()` class.
- Create a prompt that completes the given `story` using an f-string,
  delimiting the `story` with triple backticks.
- Get the generated response.

**Answer**

```{python}
# Set your API key
client = OpenAI()

# Create a prompt that completes the story
prompt = f"""Complete the story delimited by triple backticks. 
 ```{story}```"""

# Get the generated response 
response = get_response(prompt)

print("\n Original story: \n", story)
print("\n Generated story: \n", response)
```

### Building specific and precise prompts

In the previous exercise, you generated text that completes a given
`story`. Your team was happy with your achievement, however, they want
you to follow specific guidelines when it comes to **length** and
**style**. Your task now is to craft a more specific prompt that
controls these aspects of the generated story.

The `OpenAI` package, the `get_response()` function, and the same
`story` variable have been pre-loaded for you.

**Instructions**

- Set your API key to `api_key` within the `OpenAI()` class.
- Craft a prompt that completes the given `story` with **only two
  paragraphs** in the style of **William Shakespeare**; use an f-string,
  and delimit the `story` with triple backticks.

**Answer**

```{python}
# Set your API key
client = OpenAI()

# Create a request to complete the story
prompt = f"""Complete the story delimited by triple backticks with only two paragraphs using the style of William Shakespeare. 
 ```{story}```"""

# Get the generated response
response = get_response(prompt)

print("\n Original story: \n", story)
print("\n Generated story: \n", response)
```

### Generating a table

Imagine you are a developer working for a renowned online bookstore
known for its extensive collection of science fiction novels. Today, you
have a task at hand: to create a **table** of ten must-read science
fiction books for the website's homepage. This will enhance the user
experience on the website, helping fellow sci-fi enthusiasts discover
their next great read.

The `OpenAI` package and the `get_response()` function have been
pre-loaded for you.

**Instructions**

- Set your API key to `api_key` within the `OpenAI()` class.
- Craft a prompt that generates a **table** of **10 books**, with
  columns for **Title**, **Author**, and **Year**, that you should read
  given that you are a **sci-fi lover**.
- Get the response.

**Answer**

```{python}
# Set your API key
client = OpenAI()

# Create a prompt that generates the table
prompt = "Generate a table containing 10 books I should read if I am a sci-fi lover, with columns for Title, Author, and Year."

# Get the response
response = get_response(prompt)
print(response)
```

### Customizing output format

You work as a developer at a startup that offers a text analysis
platform for content creators. Your platform helps users automatically
categorize and format their content, saving them time and effort. Today,
your task is to create a feature that detects the **language** of a
given piece of `text` and generates a **suitable title** for that text
in a **custom format**. You decide to craft a prompt that guides the
language model through this.

The `OpenAI` package, the `get_response()` function, and the `text`
variable have been pre-loaded for you.

**Instructions**

- Set your API key to `api_key` within the `OpenAI()` class.
- Create the `instructions` for the prompt, asking the model to define
  the **language** and generate a suitable **title** for a `text` that
  will be provided using triple backtick delimiters.
- Create the `output_format` with directions to include the text,
  language, and title, each on a separate line, using 'Text:',
  'Language:', and 'Title:' as prefixes for each line.
- Create the `final_prompt` by combining all parts and the delimited
  `text` to use.

**Answer**

```{python}
# Set your API key
client = OpenAI()

# Create the instructions
instructions = "You will be provided with a text delimited by triple backticks. Infer its language, then generate a suitable title for it. "

# Create the output format
output_format = """Use the following format for the output:
         - Text: <the text>
         - Language: <the text language>
         - Title: <the generated title>"""

# Create the final prompt
prompt = instructions + output_format + f"```{text}```"
response = get_response(prompt)
print(response)
```

### Using conditional prompts

Building upon the previous task, your next challenge is to enhance the
responses you received. When processing a given text, you need to
determine its language, count the number of sentences, and generate a
suitable title if the text contains more than one sentence. However,
here's the new twist: if the text consists of only one sentence, no
title should be generated, and instead, the model should display "N/A".
This modification ensures that the title is generated only for texts
with multiple sentences, providing a more refined and practical output
for your platform's users.

The `OpenAI` package, the `get_response()` function, and the sample
`text` have been pre-loaded for you.

**Instructions**

- Set your API key to `api_key` within the `OpenAI()` class.
- Create the `instructions`, with the directions to infer the
  **language** and the **number of sentences** of the given delimited
  `text`; then if the text contains more than one sentence, generate a
  suitable **title** for it, otherwise, write **'N/A'** for the title.
- Create the `output_format`, with directions to include the text,
  language, number of sentences, and title, each on a separate line,and
  ensure to use 'Text:', 'Language:', 'N_sentences:', and 'Title:' as
  prefixes for each line.

**Answer**

```{python}
# Set your API key
client = OpenAI()

# Create the instructions
instructions = "You will be provided with a text delimited by triple backticks. Infer its language and the number of sentences it contains. Then, if the text has more than one sentence, generate a suitable title for it. Otherwise, if the text contains only one sentence, write 'N/A' for the title."

# Create the output format
output_format = """The output should follow this format:
          - Text: <the given text>
          - Language: <the text language>
          - N_sentences: <number of sentences>
          - Title: <the generated title>'."""

prompt = instructions + output_format + f"```{text}```"
response = get_response(prompt)
print(response)
```

## Advanced Prompt Engineering Strategies

### Controlling output structure

One way to control the output structure provided by a language model is
to give it a sample question-answer in the prompt. The model will learn
from it and follow it when generating responses for similar questions.
This exercise aims to let you build a one-shot prompt that extracts odd
numbers from a given set of numbers and displays them as a set of
numbers between brackets, separated by commas as shown in the
instructions.

The `OpenAI` package and the `get_response()` function have been
pre-loaded for you.

**Instructions**

- Set your API key to `api_key` within the `OpenAI()` class.
- Create a one-shot `prompt` that learns how to extract the odd numbers
  from the set `{1, 3, 7, 12, 19}`, and seeks an answer for the set
  `{3, 5, 11, 12, 16}`.

**Answer**

```{python}
# Set your API key
client = OpenAI()

# Create a one-shot prompt
prompt = """
     Q: Extract the odd numbers from {1, 3, 7, 12, 19}. A: Odd numbers = {1, 3, 7, 19}
     Q: Extract the odd numbers from {3, 5, 11, 12, 16}. A:
"""

response = get_response(prompt)
print(response)
```

### Sentiment analysis with few-shot prompting

Although sentiment analysis is possible with a language model's own
knowledge, sometimes this task requires additional information to guide
the model. In the context of market research, your goal in this exercise
is to use few-shot prompting to perform sentiment analysis on customer
reviews, assigning a number for a given text (-1: negative, 1:
positive). The following examples should be provided as previous
conversations for the model to learn from.

- The product quality exceeded my expectations -\> 1
- I had a terrible experience with this product's customer service -\>
  -1

The `OpenAI` package has been pre-loaded for you.

**Instructions**

- Set your API key to `api_key` within the `OpenAI()` class.
- Provide the examples as previous conversations assigning the text as
  `context` for the user role and the number as context for the
  assistant role.
- Provide the following text for the model to classify and use the
  appropriate role:
  `The price of the product is really fair given its features`.

**Answer**

```{python}
# Set your API key
client = OpenAI()

response = client.chat.completions.create(
  model = "gpt-3.5-turbo",
  # Provide the examples as previous conversations
  messages = [{"role": "user",
         "content": "The product quality exceeded my expectations"},
              {"role": "assistant",
         "content": "1"},
              {"role": "user",
         "content": "I had a terrible experience with this product's customer service"},
              {"role": "assistant",
         "content": "-1"}, 
              # Provide the text for the model to classify
              {"role": "user",
         "content": "The price of the product is really fair given its features"}
             ],
  temperature = 0
)
print(response.choices[0].message.content)
```

### Single-step prompt to plan a trip

Imagine you're a developer taking a break and planning a beach vacation.
You want to apply your prompting skills to plan the perfect trip. As an
initial step, you decide to use a **standard single-step prompt** to
seek assistance.

The `OpenAI` package and the `get_response()` function have been
pre-loaded for you.

The `get_response()` function in this exercise employs the `max_tokens`
parameter to help this exercise run faster.

**Instructions**

- Set your API key to `api_key` within the `OpenAI()` class.
- Create a single-step `prompt` asking the model to help you plan a
  beach vacation.

**Answer**

```{python}
# Set your API key
client = OpenAI()

# Create a single-step prompt to get help planning the vacation
prompt = "Help me plan a beach vacation."

response = get_response(prompt)
print(response)
```

### Multi-step prompt to plan a trip

You realized that the single-step prompt you built in the previous
exercise was not effective, because the answer was too vague for what
you had in mind. Now you will improve your prompt by explicitly
specifying the steps to follow while helping you plan the trip. The plan
should have **four potential locations** for your beach vacation, and
each location should have some **accommodation options**, some
**activities**, and an **evaluation of the pros and cons**.

The `OpenAI` package and the `get_response()` function have been
pre-loaded for you.

The `get_response()` function in this exercise employs the `max_tokens`
parameter to help this exercise run faster.

**Instructions**

- Set your API key to `api_key` within the `OpenAI()` class.
- Create a multi-step `prompt` asking the model to help you plan a beach
  vacation, according to the details mentioned.

**Answer**

```{python}
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
```

### Analyze solution correctness

You're back from your relaxing vacation and you've been assigned the
task of reviewing and correcting some programming tasks that your
interns were working on during your absence. One of the tasks they were
assigned is the calculation of the area of a shape. You are provided
with a `code` string that contains a function designed to calculate the
area of a rectangle, and need to assess its correctness. The ideal
function for you is a function that has **correct syntax**, **receives
two inputs**, and **returns one output**.

The `OpenAI` package and the `get_response()` function have been
pre-loaded for you.

**Instructions**

- Set your API key to `api_key` within the `OpenAI()` class.
- Create a multi-step `prompt` asking the model to assess the function
  provided in the delimited `code` string according to your ideal
  function criteria.

**Answer**

```{python}
# Set your API key
client = OpenAI()

code = '''
def calculate_rectangle_area(length, width):
    area = length * width
    return area
'''

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
```

### Reasoning with chain-of-thought prompts

Chain-of-thought prompting is helpful to explain the reasoning behind
the answer that the model is giving, especially in complex tasks such as
generating the solution for a mathematical problem or a riddle. In this
exercise, you will craft a chain-of-thought prompt to let the language
model guess the age of your friend's father based on some information
you will provide.

The `OpenAI` package and the `get_response()` function have been
pre-loaded for you.

**Instructions**

- Set your API key to `api_key` within the `OpenAI()` class.
- Create a chain-of-thought `prompt` to get the age of your friend's
  father in 10 years, given that now he's double your friend's age, and
  your friend is 20.

**Answer**

```{python}
# Set your API key
client = OpenAI()

# Create the chain-of-thought prompt
prompt = "Compute the age of my friend's father in 10 years, given that now he's double my friend's age, and my friend is 20. Give a step by step explanation."

response = get_response(prompt)
print(response)
```

### One-shot chain-of-thought prompts

When you need to sum the even numbers within a given set, you first have
to identify these even numbers and then sum them. You can teach this to
a language model via one or more examples, and it will follow this
strategy to operate on new sets.

Your goal in this exercise is to teach the model how to apply this
procedure on the following set: `{9, 10, 13, 4, 2}`, and then ask the
model to perform it on a new set: `{15, 13, 82, 7, 14}`. This is how you
perform chain-of-thought prompting through one-shot prompting.

The `OpenAI` package and the `get_response()` function have been
pre-loaded for you.

**Instructions**

- Set your API key to `api_key` within the `OpenAI()` class.
- Define an `example` that teaches the model how to reason on the set
  `{9, 10, 13, 4, 2}`.
- Define a `question`, similar to the one in the `example`, that asks
  the model to reason on a new set `{15, 13, 82, 7, 14}`.
- Create the final prompt.

**Answer**

```{python}
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
```

### Self-consistency prompts

Imagine you own a store that sells laptops and mobile phones. You start
your day with 50 devices in the store, out of which 60% are mobile
phones. Throughout the day, three clients visited the store, each of
them bought one mobile phone, and one of them bought additionally a
laptop. Also, you added to your collection 10 laptops and 5 mobile
phones. How many laptops and mobile phones do you have by the end of the
day? This problem is defined in the `problem_to_solve` string, and you
will use a self-consistency prompt to solve it.

The `OpenAI` package and the `get_response()` function have been
pre-loaded for you.

The `get_response()` function in this exercise employs the `max_tokens`
parameter to help this exercise run faster.

**Instructions**

- Set your API key to `api_key` within the `OpenAI()` class.
- Create the `self_consistency_instruction` that allows the model to
  solve the problem with three experts and combine the results with a
  majority vote.
- Create the final `prompt` by combining the
  `self_consistency_instruction` and the `problem_to_solve`.

**Answer**

```{python}
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
```

### Iterative prompt engineering for standard prompts

You are a developer using prompt engineering techniques for your various
tasks, and you want to carefully select the right language model. You
wrote an initial `prompt` to know what are the top ten pre-trained
language models out there. Now, your goal is to refine this prompt to
generate a table presenting information on each model's name, **release
year** and its **owning company**.

The `OpenAI` package and the `get_response()` function have been
pre-loaded for you.

**Instructions**

- Set your API key to `api_key` within the `OpenAI()` class.
- Iteratively refine the `prompt` to get the desired outcome, a table
  having three columns for the top ten pre-trained language models
  listing the model name, release year, and owning company.

**Answer**

```{python}
# Set your API key
client = OpenAI()

# Refine the following prompt
prompt = "Generate a table that contains the top 10 pre-trained language models, with columns for language model, release year, and owners."

response = get_response(prompt)
print(response)
```

### Iterative prompt engineering for few-shot prompts

You are currently working on a project at your content creation company.
The project's objective is to develop a text classification model
capable of accurately identifying and categorizing different emotions in
text, such as happiness, sadness, and fear. In cases where the text does
not contain any discernible emotion, you aim for the model to respond
with "no explicit emotion."

You decided to use the provided few-shot `prompt`. However, you've
noticed that "Time flies like an arrow" is being incorrectly classified
as "surprise." Your objective now is to refine the `prompt` so that the
model correctly classifies this particular example as "no explicit
emotion."

The `OpenAI` package and the `get_response()` function have been
pre-loaded for you.

**Instructions**

- Set your API key to `api_key` within the `OpenAI()` class.
- Iteratively refine the `prompt`, by refining the examples, to get the
  output **no explicit emotion** for the `"Time flies like an arrow"`
  example.

**Answer**

```{python}
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
```

## Prompt Engineering for Business Applications

### Market research report summarization

A market research firm needs to analyze and summarize lengthy reports on
market trends and customer behavior. They want to know how AI and data
privacy are shaping the market and how they're affecting customers. You
are provided with a `report` string about markets trends and how they're
affecting customer behavior. Your goal is to craft a prompt to summarize
it while focusing on aspects related to AI and data privacy to see their
effect on customers.

The `OpenAI` package, the `report` string, and the `get_response()`
function have been pre-loaded for you.

**Instructions**

- Set your API key to `api_key` within the `OpenAI()` class.
- Craft a prompt that summarizes the `report` in **maximum five
  sentences**, while focusing on aspects related to **AI and data
  privacy** using an f-string.

**Answer**

```{python}
# Set your API key
client = OpenAI()

# Craft a prompt to summarize the report
prompt = f"""
Summarize the report delimited by triple backticks with a maximum of 5 sentences, while focusing on aspects related to AI and data privacy.
 ```{report}```
"""

response = get_response(prompt)

print("Summarized report: \n", response)
```

### Product features summarization

An electronics review website wants to provide concise and easy-to-read
summaries of product features for its readers, allowing them to compare
and evaluate different products quickly. The review website wants to
generate bullet-point summaries. They want you to craft a prompt that
summarizes a `product_description` for a smartphone.

The `OpenAI` package, the `product_description`, and the
`get_response()` function have been pre-loaded for you.

**Instructions**

- Set your API key to `api_key` within the `OpenAI()` class.
- Craft a prompt that summarizes the `product_description` in **no more
  than five bullet points** while focusing on the product features and
  specifications.

**Answer**

```{python}
# Set your API key
client = OpenAI()

# Craft a prompt to summarize the product description
prompt = f"""
Summarize the product description delimited by triple backticks, in at most five bullet points while focusing on the product features and specifications
 ```{product_description}```
"""

response = get_response(prompt)

print("Original description: \n", product_description)
print("Summarized description: \n", response)
```

### Product description expansion

As you continue your work on the electronics review website, you've come
across some products that are already summarized but lack a
comprehensive description on the product's main page. Your task now is
to expand these concise product descriptions into detailed narratives,
ensuring that each product has both a full description and a bulleted
summary for easy comparison. The complete description should effectively
capture the product's unique features, benefits, and potential
applications. You will apply your prompt on a smart home security camera
represented by its `product_description`.

The `OpenAI` package, the `product_description` string, and the
`get_response()` function have been pre-loaded for you.

**Instructions**

- Set your API key to `api_key` within the `OpenAI()` class.
- Craft a prompt that expands the `product_description` and writes a
  **one paragraph** comprehensive overview capturing the key
  information.

**Answer**

```{python}
# Set your API key
client = OpenAI()

# Craft a prompt to expand the product's description
prompt = f"""
Expand the product description for the Smart Home Security Camera delimited by triple backticks to provide a comprehensive overview of its features, benefits, potential applications, without bypassing the limit of one paragraph. 
 ```{product_description}```
"""

response = get_response(prompt)

print("Original description: \n", product_description)
print("Expanded description: \n", response)
```

### Translation for multilingual communication

A multinational company wants to expand its reach to more international
markets. They need a language translation solution to convert their
product descriptions and marketing materials into multiple languages.
These will then be verified before being published.

Your task is to design a prompt that translates text from one language
to multiple other languages, facilitating effective communication with
customers worldwide. You will apply your prompt on a provided
`marketing_message` that introduces their latest collection of premium
leather handbags.

The `OpenAI` package, the `marketing_message` string, and the
`get_response()` function have been pre-loaded for you.

**Instructions**

- Set your API key to `api_key` within the `OpenAI()` class.
- Craft a prompt that translates the `marketing_message` from English to
  French, Spanish, and Japanese.

**Answer**

```{python}
# Set your API key
client = OpenAI()

# Craft a prompt that translates
prompt = f"""Translate the English marketing message delimited by triple backticks to French, Spanish, and Japanese
 ```{marketing_message}```
"""

response = get_response(prompt)

print("English:", marketing_message)
print(response)
```

### Tone adjustment for email marketing

An e-commerce company regularly conducts email marketing campaigns to
promote its products, inform customers about new arrivals, and offer
exclusive deals. The company has a hypothesis that their current
strategy is too informal and they want to test out how tone adjustment
to their emails could help boost customer engagement.

Your task is to craft a prompt that can effectively transform the tone
of marketing emails. You will apply your prompt on the `sample_email`
provided.

The `OpenAI` package, the `sample_email` string, and the
`get_response()` function have been pre-loaded for you.

**Instructions**

- Set your API key to `api_key` within the `OpenAI()` class.
- Craft a prompt that transforms the `sample_email` by changing its tone
  to be professional, positive, and user-centric.

**Answer**

```{python}
# Set your API key
client = OpenAI()

# Craft a prompt to change the email's tone
prompt = f"""
Write the email delimited by triple backticks using a professional, positive, and user-centric tone:
 ```{sample_email}```
"""

response = get_response(prompt)

print("Before transformation: \n", sample_email)
print("After transformation: \n", response)
```

### Writing improvement

A popular online community relies on user-generated content to thrive.
Users frequently contribute reviews, articles, and comments, but the
quality of these contributions varies. To elevate the overall experience
for its members, the community aims to enhance user-generated texts.
This includes fixing grammar errors and refining writing tones to create
a more polished and engaging environment for all users. Your task is to
build a multi-step prompt that proofreads and adjusts the tone of a
given `text`.

The `OpenAI` package, the `text` string to operate on, and the
`get_response()` function have been pre-loaded for you.

**Instructions**

- Set your API key to `api_key` within the `OpenAI()` class.
- Craft a multi-step prompt that proofreads the text without changing
  its structure and adjusts its tone to be formal and friendly.

**Answer**

```{python}
# Set your API key
client = OpenAI()

# Craft a prompt to transform the text
prompt = f"""Transform the text delimited by triple backticks with the following two steps:
Step 1 - Proofread it without changing its structure
Step 2 - Change the tone to be formal and friendly
 ```{text}```"""

response = get_response(prompt)

print("Before transformation:\n", text)
print("After transformation:\n", response)
```

### Customer support ticket routing

A large customer support team receives many tickets related to different
business areas, such as technical issues, billing inquiries, and product
feedback. Your task is to create a prompt that automatically classifies
incoming tickets into these three groups and routes them to the
appropriate support specialists, reducing response times and enhancing
customer satisfaction. You will test your prompt on a provided sample
`ticket`.

The `OpenAI` package, the `ticket` string, and the `get_response()`
function have been pre-loaded for you.

**Instructions**

- Set your API key to `api_key` within the `OpenAI()` class.
- Craft a prompt that classifies the `ticket` as technical issue,
  billing inquiry, or product feedback, without providing anything else
  in the response.

**Answer**

```{python}
# Set your API key
client = OpenAI()

# Craft a prompt to classify the ticket
prompt = f"""Classify the ticket delimited by triple backticks as technical issue, billing inquiry, or product feedback. Your response should just contain the class and nothing else.
 ```{ticket}```"""

response = get_response(prompt)

print("Ticket: ", ticket)
print("Class: ", response)
```

### Customer support ticket analysis

Not only does a customer support team receive tickets related to
different business areas, but the inquiries also come through various
channels, such as email, chat, and social media. The company wants to
automatically extract key entities from customer support tickets to
categorize and prioritize them appropriately to provide better support.
Your job is to craft a few-shot prompt that helps them achieve that.

You have three sample tickets (`ticket_1`, `ticket_2`, and `ticket_3`)
and their corresponding entities (`entities_1`, `entities_2`, and
`entities_3`) to inform the model what to look for and how to display
it. You need the model to extract entities from the new `ticket_4`
string.

The `OpenAI` package, the `ticket_4` string, and the `get_response()`
function have been pre-loaded for you. Also, you have access to the
ticket and entity variables previously mentioned.

**Instructions**

- Set your API key to `api_key` within the `OpenAI()` class.
- Craft a few-shot prompt that uses three tickets and corresponding
  entities, to extract entities from the new ticket `ticket_4`.

**Answer**

```{python}
# Set your API key
client = OpenAI()

# Craft a few-shot prompt to get the ticket's entities
prompt = f"""Ticket: {ticket_1} -> Entities: {entities_1}
            Ticket: {ticket_2} -> Entities: {entities_2}
            Ticket: {ticket_3} -> Entities: {entities_3}
            Ticket: {ticket_4} -> Entities: """

response = get_response(prompt)

print("Ticket: ", ticket_4)
print("Entities: ", response)
```

### Code generation with problem description

You work as an analyst for a retail company and analyze monthly sales
data. You need to develop a Python function that accepts a list of 12
numbers representing sales for each month of the year and outputs the
month with the highest sales value. This information will help your
company identify the most profitable month. You feed the problem
description to a language model to get help. You will then check the
code to ensure it's correct for use.

The `OpenAI` package and the `get_response()` function have been
pre-loaded for you.

**Instructions**

- Set your API key to `api_key` within the `OpenAI()` class.
- Craft a prompt that asks the model to write a Python function that
  receives a list of 12 floats representing monthly sales data as input
  and, returns the month with the highest sales value as output.

**Answer**

```{python}
# Set your API key
client = OpenAI()

# Craft a prompt that asks the model for the function
prompt = "Write a Python function that accepts a list of 12 numbers representing sales for each month of the year, and outputs the month with the highest sales value"

response = get_response(prompt)
print(response)
```

### Input-output examples for code generation

You work as a project manager and need to estimate the time it will take
to complete different projects. Your task is to develop a Python
function that can predict the estimated completion time for a project
based on historical data. You are given a set of examples in the
`examples` string where different factors are associated with project
completion time. Each example includes the factors' numerical values and
the corresponding estimated completion time. You decide to prompt the
language model to help you identify the underlying pattern that maps the
inputs to the outputs and provides the code for the function. As always,
you'll verify the correctness of the code before using it.

The `OpenAI` package and the `get_response()` function have been
pre-loaded for you.

**Instructions**

- Set your API key to `api_key` within the `OpenAI()` class.
- Craft a prompt that asks the model to infer the Python function that
  maps the inputs to the outputs in the provided `examples`.

**Answer**

```{python}
# Set your API key
client = OpenAI()

examples="""input = [10, 5, 8] -> output = 24
input = [5, 2, 4] -> output = 12
input = [2, 1, 3] -> output = 7
input = [8, 4, 6] -> output = 19
"""

# Craft a prompt that asks the model for the function
prompt = f"""You are provided with input-output examples delimited by triple backticks for a Python function where different factors are associated with project completion time. Each example includes numerical values for the factors and the corresponding estimated completion time. Write a code for this function.
 ```{examples}```"""

response = get_response(prompt)
print(response)
```

### Modifying code with multi-step prompts

You are a home improvement contractor specializing in flooring
installations. You need to develop a Python function that calculates the
area and perimeter of a rectangular floor in a room to help you
determine the amount of flooring material required for the project.

You are given a string named `function`, which contains a starter
function that calculates the area of a rectangular floor given its width
and length. Using a multi-step prompt, you need to prompt the language
model to modify this function to return the perimeter of the rectangle
as well, and to test if the inputs (floor dimensions) are positive, and
if not, display appropriate error messages.

The `OpenAI` package, the `function` string, and the `get_response()`
function have been pre-loaded for you.

**Instructions**

- Set your API key to `api_key` within the `OpenAI()` class.
- Craft a multi-step prompt that asks the model to modify the `function`
  according to the specified requirements.

**Answer**

```{python}
# Set your API key
client = OpenAI()

function = """def calculate_area_rectangular_floor(width, length):
     return width*length"""

# Craft a multi-step prompt that asks the model to adjust the function
prompt = f"""Modify the script delimited by triple backticks as follows:
             - The function should return the perimeter of the rectangular floor as well.
             - The inputs (floor dimensions) should be positive. Otherwise, appropriate error messages should be displayed.
           ```{function}```"""

response = get_response(prompt)
print(response)
```

### Explaining code step by step

As a financial analyst at a consulting firm, you're tasked with
analyzing investment portfolios and providing insights to clients. While
reviewing a set of financial data files, you come across a Python
`function` that seems related to analyzing portfolios, but you're unsure
of its exact purpose. You decide to use chain-of-thought prompting to
let the language model decipher it step by step.

The `OpenAI` package, the `function` string, and the `get_response()`
function have been pre-loaded for you.

**Instructions**

- Set your API key to `api_key` within the `OpenAI()` class.
- Craft a chain-of-thought prompt that asks the model to explain the
  provided `function`.

**Answer**

```{python}
# Set your API key
client = OpenAI()

# Craft a chain-of-thought prompt that asks the model to explain what the function does
prompt = f"""Explain what the function delimited by triple backticks does. Let's think step by step
 ```{function}```
"""
 
response = get_response(prompt)
print(response)
```

## Prompt Engineering for Chatbot Development

### Creating a dual-prompt get_response() function

Since the majority of the following exercises will be based on calling
the `chat.completions` endpoint of the OpenAI API with two prompts (a
system prompt and a user prompt), in this exercise, you will create a
dual-prompt `get_response()` function that receives two prompts as input
(`system_prompt` and `user_prompt`) and returns the response as an
output. You will then apply this function to any example of your choice.
In future exercises, this function will be pre-loaded for you.

The `OpenAI` package has been pre-loaded for you.

**Instructions**

- Set your API key to `api_key` within the `OpenAI()` class.
- Assign the role and content of each message in the `messages` list.
- Try out the function by passing a `system_prompt` and a `user_prompt`
  of your choice.

**Answer**

```{python}
# Set your API key
client = OpenAI()

def get_response(system_prompt, user_prompt):
  # Assign the role and content for each message
  messages = [{"role": "system", "content": system_prompt},
          {"role": "user", "content": user_prompt}]  
  response = client.chat.completions.create(
      model="gpt-3.5-turbo", messages= messages, temperature=0)

  return response.choices[0].message.content

# Try the function with a system and user prompt of your choice 
response = get_response("You are an expert data scientist that explains complex concepts in understandable terms", "Define AI")
print(response)
```

### Customer support chatbot

You are tasked with developing a customer support chatbot for an
e-commerce company specializing in electronics. This chatbot will assist
users with inquiries, order tracking, and troubleshooting common issues.
You aim to create a system prompt that clearly defines the chatbot's
purpose and provides response guidelines that set the tone for
interactions and specify the intended audience. A sample user prompt is
provided.

The `OpenAI` package and the `get_response()` function have been
pre-loaded for you.

**Instructions**

- Set your API key to `api_key` within the `OpenAI()` class.
- Write out who this chatbot is for and what it should do and save this
  as the `chatbot_purpose`.
- Define the target audience as tech-savvy individuals interested in
  purchasing electronic gadgets and save to `audience_guidelines`.
- Define the `tone_guidelines` that ask the chatbot to use a
  professional and user-friendly tone while interacting with customers.

**Answer**

```{python}
# Set your API key
client = OpenAI()

# Define the purpose of the chatbot
chatbot_purpose = "You are the customer support chatbot for an e-commerce platform specializing in electronics. Your role is to assist customers with inquiries, order tracking, and troubleshooting common issues related to their purchases. "

# Define audience guidelines
audience_guidelines = "Your primary audience consists of tech-savvy individuals who are interested in purchasing electronic gadgets. "

# Define tone guidelines
tone_guidelines = "Maintain a professional and user-friendly tone in your responses."

base_system_prompt = chatbot_purpose + audience_guidelines + tone_guidelines
response = get_response(base_system_prompt, "My new headphones aren't connecting to my device")
print(response)
```

### Behavioral control of a customer support chatbot

When the company started using your chatbot from the previous exercise,
they realized they wanted it to behave differently. They'd like to
incorporate two behavioral conditions. First, they want to refine the
customer support chatbot's interactions by asking for an order number if
the user is inquiring about an order without providing one. Second, they
want the model to express empathy by starting the response with "I'm
sorry to hear about your issue with …" if the user reports a technical
issue.

They've assigned this update to you. You need to append these conditions
to the `base_system_prompt` that represents the prompt you engineered in
the previous exercise and obtain a `refined_system_prompt`. You will
test the chatbot on two queries.

The `OpenAI` package, the `base_system_prompt` string developed in the
previous exercise, and the `get_response()` function have been
pre-loaded for you.

**Instructions**

- Set your API key to `api_key` within the `OpenAI()` class.
- Ask the user for their order number if they submitted a query about an
  order without specifying an order number; save this to
  `order_number_condition`.
- Define a `technical_issue_condition` where you tell the model to start
  the response with `I'm sorry to hear about your issue with ...` if the
  user is reporting a technical issue.
- Create the `refined_system_prompt` that combines the
  `base_system_prompt` and the two new conditions.

**Answer**

```{python}
# Set your API key
client = OpenAI()

# Define the order number condition
order_number_condition = "If the user is asking about an order, and did not specify the order number, reply by asking for this number. "

# Define the technical issue condition
technical_issue_condition = "If the user is talking about a technical issue, start your response with `I'm sorry to hear about your issue with ...` "

# Create the refined system prompt
refined_system_prompt = base_system_prompt + order_number_condition + technical_issue_condition

response_1 = get_response(refined_system_prompt, "My laptop screen is flickering. What should I do?")
response_2 = get_response(refined_system_prompt, "Can you help me track my recent order?")

print("Response 1: ", response_1)
print("Response 2: ", response_2)
```

### Learning advisor chatbot

You are developing a personalized learning advisor chatbot that
recommends textbooks for users. The chatbot's role is to receive queries
from learners about their background, experience, and goals, and
accordingly, recommends a learning path of textbooks, including both
beginner-level and more advanced options. Your job is to create a
role-playing `system_prompt` for the textbook recommendation chatbot,
highlighting what it is expected to do while interacting with the users.

The `OpenAI` package, and the `get_response()` function have been
pre-loaded for you.

**Instructions**

- Set your API key to `api_key` within the `OpenAI()` class.
- Define a role-playing `system_prompt` that tells the bot to act as a
  learning advisor who can interpret learner queries as described and
  provide the relevant textbook recommendations.

**Answer**

```{python}
# Set your API key
client = OpenAI()

# Craft the system_prompt using the role-playing approach
system_prompt = "Act as a learning advisor who receives queries from users mentioning their background, experience, and goals, and accordingly provides a response that recommends a tailored learning path of textbooks, including both beginner-level and more advanced options."

user_prompt = "Hello there! I'm a beginner with a marketing background, and I'm really interested in learning about Python, data analytics, and machine learning. Can you recommend some books?"

response = get_response(system_prompt, user_prompt)
print(response)
```

### Adding guidelines for the learning advisor chatbot

In the previous exercise, you built a chatbot to recommend textbooks.
However, the company has identified a need for an update to ensure more
efficient recommendations. You are provided with a `base_system_prompt`,
similar to the one you created previously, and your task is to
incorporate `behavior_guidelines` and `response_guidelines`. These
guidelines will help control the chatbot's behavior and ensure it offers
more effective and tailored textbook recommendations to users.

The `OpenAI` package, and the `get_response()` function have been
pre-loaded for you.

**Instructions**

- Set your API key to `api_key` within the `OpenAI()` class.
- Define `behavior_guidelines` for the chatbot that allow it to ask a
  user about their background, experience, and goals, whenever any of
  these is not provided in the prompt.
- Define `response_guidelines` to tell the chatbot to recommend no more
  than three textbooks.

**Answer**

```{python}
# Set your API key
client = OpenAI()

base_system_prompt = "Act as a learning advisor who receives queries from users mentioning their background, experience, and goals, and accordingly provides a response that recommends a tailored learning path of textbooks, including both beginner-level and more advanced options."

# Define behavior guidelines
behavior_guidelines = "If the user's query does not include details about their background, experience, or goals, kindly ask them to provide the missing information."

# Define response guidelines
response_guidelines = "Don't recommend more than three textbooks in the learning path"

system_prompt = base_system_prompt + behavior_guidelines + response_guidelines
user_prompt = "Hey, I'm looking for courses on Python and data visualization. What do you recommend?"
response = get_response(system_prompt, user_prompt)
print(response)
```

### Providing context through sample conversations

Suppose there is a delivery service named **MyPersonalDelivery** that
offers a wide range of delivery options for various items. You want to
create a customer service chatbot that supports customers with whatever
they need. To accomplish this, you will provide a `context_question` and
a `context_answer` about items the company delivers via previous
conversations, and you will test if the model recognizes this context
through a new user prompt.

The `OpenAI` package, the `context_question` and `context_answer`
strings have been pre-loaded for you.

**Instructions**

- Set your API key to `api_key` within the `OpenAI()` class.
- Define a `system_prompt` that defines the purpose of the chatbot and
  guides it to answer queries in a gentle way.
- Use the `system_prompt`, the `context_question`, and `context_answer`
  to formulate a conversation that the chatbot can use as context in
  order to respond to the new user query.

**Answer**

```{python}
# Set your API key
client = OpenAI()

# Define the system prompt
system_prompt = "You are a customer service chatbot for MyPersonalDelivery, a delivery service that offers a wide range of delivery options for various items. You should respond to user queries in a gentle way."

context_question = "What types of items can be delivered using MyPersonalDelivery?"
context_answer = "We deliver everything from everyday essentials such as groceries, medications, and documents to larger items like electronics, clothing, and furniture. However, please note that we currently do not offer delivery for hazardous materials or extremely fragile items requiring special handling."

# Add the context to the model
response = client.chat.completions.create(
  model="gpt-3.5-turbo",
  messages=[{"role": "system", "content": system_prompt},
            {"role": "user", "content": context_question},
            {"role": "assistant", "content": context_answer},
            {"role": "user", "content": "Do you deliver furniture?"}])
response = response.choices[0].message.content
print(response)
```

### Providing context through system prompt

Now you want to use system prompts in order to provide context for the
chatbot about **MyPersonalDelivery** instead of relying on sample
conversations. You are provided with a detailed `service_description`
that introduces the services being offered and the benefits of choosing
this service. You will then test a user query to see if the model
recognizes the context effectively.

The `OpenAI` package and the `service_description` string have been
pre-loaded for you.

**Instructions**

- Set your API key to `api_key` within the `OpenAI()` class.
- Define a `system_prompt` that defines the purpose of the chatbot
  including the `service_description`, and guides it to answer queries
  in a gentle way.
- Get the response using the `get_response()` function.

**Answer**

```{python}
# Set your API key
client = OpenAI()

# Define the system prompt
system_prompt = f"""You are a customer service chatbot for MyPersonalDelivery whose service description is delimited by triple backticks. You should respond to user queries in a gentle way.
 ```{service_description}```
"""

user_prompt = "What benefits does MyPersonalDelivery offer?"

# Get the response to the user prompt
response = get_response(system_prompt, user_prompt)

print(response)
```
