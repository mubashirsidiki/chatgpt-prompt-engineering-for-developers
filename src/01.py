# added/edited
from dotenv import load_dotenv
from openai import OpenAI
import os
import openai

load_dotenv()
openai.api_key = os.environ["OPENAI_API_KEY"]

# Set your API key
client = OpenAI()


def get_response(prompt):
    # Create a request to the chat completions endpoint
    response = client.chat.completions.create(
        model="gpt-3.5-turbo",
        # Assign the role and content for the message
        messages=[{"role": "user", "content": prompt}],
        temperature=0,
    )
    return response.choices[0].message.content


# Test the function with your prompt
response = get_response("Write a poem about ChatGPT")
print(response)


# Set your API key
client = OpenAI()

# Craft a prompt that follows the instructions
prompt = "Write a poem about ChatGPT. Use basic English that a child can understand."

# Get the response
response = get_response(prompt)

print(response)

# added/edited
story = "\nIn a distant galaxy, there was a brave space explorer named Alex. Alex had spent years traveling through the cosmos, discovering new planets and meeting alien species. One fateful day, while exploring an uncharted asteroid belt, Alex stumbled upon a peculiar object that would change the course of their interstellar journey forever...\n"


# Set your API key
client = OpenAI()

# Create a prompt that completes the story
prompt = f"""Complete the story delimited by triple backticks. 
 ```{story}```"""

# Get the generated response
response = get_response(prompt)

print("\n Original story: \n", story)
print("\n Generated story: \n", response)


# Set your API key
client = OpenAI()

# Create a request to complete the story
prompt = f"""Complete the story delimited by triple backticks with only two paragraphs using the style of William Shakespeare. 
 ```{story}```"""

# Get the generated response
response = get_response(prompt)

print("\n Original story: \n", story)
print("\n Generated story: \n", response)


# Set your API key
client = OpenAI()

# Create a prompt that generates the table
prompt = "Generate a table containing 10 books I should read if I am a sci-fi lover, with columns for Title, Author, and Year."

# Get the response
response = get_response(prompt)
print(response)

# added/edited
text = "The sun was setting behind the mountains, casting a warm golden glow across the landscape. Birds were chirping happily, and a gentle breeze rustled the leaves of the trees. It was a perfect evening for a leisurely stroll in the park"


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

# added/edited
text = "The sun was setting behind the mountains, casting a warm golden glow across the landscape."


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
