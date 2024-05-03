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


# Craft a prompt that follows the instructions
prompt = "Write a poem about ChatGPT. Use basic English that a child can understand."

# Get the response
response = get_response(prompt)
print(response)
