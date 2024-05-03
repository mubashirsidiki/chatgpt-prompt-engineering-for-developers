import os

import openai
from dotenv import load_dotenv
from openai import OpenAI

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


# added/edited
text = "The sun was setting behind the mountains, casting a warm golden glow across the landscape. Birds were chirping happily, and a gentle breeze rustled the leaves of the trees. It was a perfect evening for a leisurely stroll in the park"

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
