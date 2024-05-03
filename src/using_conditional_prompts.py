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
text = "The sun was setting behind the mountains, casting a warm golden glow across the landscape."

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
