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
story = "\nIn a distant galaxy, there was a brave space explorer named Alex. Alex had spent years traveling through the cosmos, discovering new planets and meeting alien species. One fateful day, while exploring an uncharted asteroid belt, Alex stumbled upon a peculiar object that would change the course of their interstellar journey forever...\n"

# Create a prompt that completes the story
prompt = f"""Complete the story delimited by triple backticks.
 ```{story}```"""

# Get the generated response
response = get_response(prompt)
print("\n Original story: \n", story)
print("\n Generated story: \n", response)
