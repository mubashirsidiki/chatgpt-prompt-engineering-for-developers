import os

import openai
from dotenv import load_dotenv
from openai import OpenAI

load_dotenv()
openai.api_key = os.environ["OPENAI_API_KEY"]

# Set your API key
client = OpenAI()


def get_response(prompt):
    messages = [{"role": "user", "content": prompt}]
    response = client.chat.completions.create(
        model="gpt-3.5-turbo",
        messages=messages,
        temperature=0,
    )
    return response.choices[0].message.content


# added/edited
product_description = '\nProduct: "Smart Home Security Camera"\n- High-tech security camera with night vision and motion detection.\n- Easy setup and remote monitoring.\n- Two-way audio communication for real-time interaction.\n- Mobile app integration for convenient control and alerts.\n- Weather-resistant design for both indoor and outdoor use.\n- Smart AI algorithms for advanced person and object detection.\n- Cloud storage and local backup options for recorded footage.\n- Infrared LEDs for clear imaging even in complete darkness.\n- Customizable motion zones to focus on specific areas.\n- Compatibility with voice assistants for hands-free control.\n'

# Craft a prompt to expand the product's description
prompt = f"""
Expand the product description for the Smart Home Security Camera delimited by triple backticks to provide a comprehensive overview of its features, benefits, potential applications, without bypassing the limit of one paragraph.
 ```{product_description}```
"""

response = get_response(prompt)
print("Original description: \n", product_description)
print("Expanded description: \n", response)
