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
report = "\nTitle: Market Trends and Customer Behavior Analysis\n\nUnderstanding customer behavior is vital for businesses to remain competitive and relevant in today's dynamic market. This report explores recent trends and shifts in customer behavior, focusing on key drivers of change. The insights aim to assist businesses in making informed decisions and adapting strategies to meet evolving customer demands.\n\n1. Introduction:\n\n1.1 Background:\nThe analysis of customer behavior has evolved significantly due to technological advancements, data analytics, and changing consumer preferences. To stay competitive, businesses must continuously monitor and adapt to these shifting trends.\n\n1.2 Objective:\nThis report provides a comprehensive overview of research trends and changes in customer behavior, with a particular focus on the following key areas:\n\n2. AI and Data Privacy:\n\nArtificial Intelligence (AI) is transforming customer service and engagement. Companies are increasingly implementing chatbots and virtual assistants to automate customer support. Predictive analytics, powered by AI, allows businesses to forecast customer behavior, making informed decisions. However, the growing concern for data privacy, spurred by regulations like GDPR and CCPA, is impacting how companies handle customer data. Strengthening cybersecurity measures is crucial to protect customer data from cyber threats and breaches.\n\n3. E-commerce and Digital Transformation:\n\nE-commerce has experienced significant growth, accelerated by the COVID-19 pandemic. Key trends include a shift towards mobile online shopping, the integration of shopping features into social media platforms (social commerce), and the use of augmented reality (AR) and virtual reality (VR) for immersive shopping experiences.\n\n4. Personalization and Customer Experience:\n\nCustomers now expect highly personalized experiences, driving the emergence of AI-driven personalization. Omni-channel experiences that seamlessly connect online and offline interactions are increasingly important. Voice commerce, facilitated by voice-activated devices like smart speakers, is also on the rise.\n\n5. Sustainability and Ethical Consumption:\n\nConsumer awareness of environmental and ethical issues is influencing buying habits. This trend is reflected in the growing demand for eco-friendly products that are sustainable, recyclable, and biodegradable. Consumers are also favoring brands that demonstrate responsible sourcing and ethical production practices.\n\n6. Mobile-First Approach:\n\nThe widespread use of smartphones has transformed customer-business interactions. As a result, companies are heavily investing in mobile apps to provide convenience and enhance engagement. Mobile payments, including contactless methods and digital wallets, are gaining popularity.\n\n7. Conclusion:\n\nTo remain competitive in today's business landscape, organizations must closely monitor research trends and changes in customer behavior. Adaptation, innovation, and a customer-centric approach are key to success. Businesses should prioritize personalized experiences, sustainable practices, mobile accessibility, and data security to meet evolving customer demands.\n\n8. Recommendations:\n\nInvest in data analytics and AI to drive personalization and gain deeper customer insights.\nEmbrace sustainable and ethical practices to align with consumer values and preferences.\nPrioritize the development of mobile experiences and seamless omni-channel engagement.\nEnsure strict compliance with data privacy regulations and continuously enhance cybersecurity measures to safeguard customer data.\n"

# Craft a prompt to summarize the report
prompt = f"""
Summarize the report delimited by triple backticks with a maximum of 5 sentences, while focusing on aspects related to AI and data privacy.
 ```{report}```
"""

response = get_response(prompt)
print("Summarized report: \n", response)


# added/edited
product_description = "\nThe Smartphone XYZ-5000 is a device packed with innovative features to enhance the user experience. Its sleek design and vibrant display make it visually appealing, while the powerful octa-core processor ensures smooth performance and multitasking capabilities.\nThe XYZ-5000 boasts a high-resolution triple-camera system, combining a 48MP primary lens, a 12MP ultra-wide lens, and a 5MP depth sensor, enabling users to capture stunning photos and videos in various shooting scenarios. The device also supports 4K video recording and comes with advanced image stabilization features.\nWith a generous 128GB of internal storage, expandable up to 512GB via microSD, users can store a vast collection of media files and apps without worrying about running out of space. The smartphone runs on the latest Android OS and offers seamless integration with various Google services.\nIn terms of security, the XYZ-5000 features a reliable fingerprint sensor and facial recognition technology for quick and secure unlocking. Additionally, it supports NFC for contactless payments and has a dedicated AI-powered virtual assistant to simplify daily tasks.\nThe device's long-lasting 4000mAh battery ensures all-day usage, and it supports fast charging, providing hours of power with just a few minutes of charging. The XYZ-5000 is also water and dust resistant, giving users peace of mind in various environments.\nOverall, the Smartphone XYZ-5000 offers a fantastic combination of style, performance, and advanced features, making it an excellent choice for tech enthusiasts and everyday users alike.\n"

# Craft a prompt to summarize the product description
prompt = f"""
Summarize the product description delimited by triple backticks, in at most five bullet points while focusing on the product features and specifications
 ```{product_description}```
"""

response = get_response(prompt)
print("Original description: \n", product_description)
print("Summarized description: \n", response)


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


# added/edited
marketing_message = "Introducing our latest collection of premium leather handbags. Each bag is meticulously crafted using the finest leather, ensuring durability and elegance. With a variety of designs and colors, our handbags are perfect for any occasion. Shop now and experience the epitome of style and quality."

# Craft a prompt that translates
prompt = f"""Translate the English marketing message delimited by triple backticks to French, Spanish, and Japanese
 ```{marketing_message}```
"""

response = get_response(prompt)
print("English:", marketing_message)
print(response)


# added/edited
sample_email = "\nSubject: Check out our latest products!\n\nDear Customer,\n\nWe are excited to introduce our latest product line that includes a wide range of items to suit your needs. Whether you're looking for electronics, home appliances, or fashion accessories, we have it all!\n\nHurry and visit our website to explore the fantastic deals and discounts we have for you. Don't miss out on the opportunity to get the best products at unbeatable prices.\n\nThank you for being a valued customer, and we look forward to serving you soon!\n\nBest regards,\nThe Marketing Team\n"

# Craft a prompt to change the email's tone
prompt = f"""
Write the email delimited by triple backticks using a professional, positive, and user-centric tone:
 ```{sample_email}```
"""

response = get_response(prompt)
print("Before transformation: \n", sample_email)
print("After transformation: \n", response)


text = "\nHey guys, wanna know a cool trick? Here's how u can up your productivity game! First, download this awesome app, it's like the best thing ever! Then, just start using it and u'll see the difference. Its super easy and fun, trust me! So, what are u waiting for? Try it out now!\n"

# Craft a prompt to transform the text
prompt = f"""Transform the text delimited by triple backticks with the following two steps:
Step 1 - Proofread it without changing its structure
Step 2 - Change the tone to be formal and friendly
 ```{text}```"""

response = get_response(prompt)
print("Before transformation:\n", text)
print("After transformation:\n", response)


# added/edited
ticket = "\nSubject: Urgent - Login Error\n\nHi Support Team,\n\nI'm having trouble accessing my account with the username \"example_user.\" Every time I try to log in, I encounter an error message. I've already attempted to reset my password, but the issue persists. I need to resolve this problem urgently, as I have pending tasks that require immediate attention.\n\nPlease investigate and assist promptly.\n\nThanks,\nJohn.\n"

# Craft a prompt to classify the ticket
prompt = f"""Classify the ticket delimited by triple backticks as technical issue, billing inquiry, or product feedback. Your response should just contain the class and nothing else.
 ```{ticket}```"""

response = get_response(prompt)
print("Ticket: ", ticket)
print("Class: ", response)


# added/edited
ticket_1 = "Hi there! My name is John Smith, and I am experiencing issues with your premium software, XYZ Pro. My license key is ABC12345. I purchased it last week, but it's not activating properly on my computer."
ticket_2 = "Dear support team, I am writing to inquire about the delivery status of my order. My name is Jane Doe, and I placed an order for a laptop on your website two days ago. The order number is ORD56789. Can you please provide an update on the delivery?"
ticket_3 = "Hello, I am having trouble accessing my account on your mobile app. My name is Alex Johnson, and I have a subscription for your Gold Plan. Can you help me resolve this issue?"
ticket_4 = "Greetings, I am facing technical difficulties with your software, ABC Editor. My name is Sarah Lee, and I recently upgraded to the latest version. However, whenever I try to save my work, the software crashes. Can you please help me resolve this problem?"
entities_1 = "\n* Customer Details:\n  - Name: John Smith\n  - License Key: ABC12345\n* Product/Service Mentions:\n  - Product: XYZ Pro (premium software)\n"
entities_2 = "\n* Customer Details:\n  - Name: Jane Doe\n* Product/Service Mentions:\n  - Product: laptop"
entities_3 = "\n* Customer Details:\n  - Name: Alex Johnson\n* Product/Service Mentions:\n  - Product: mobile app\n  - Service: Gold Plan"

# Craft a few-shot prompt to get the ticket's entities
prompt = f"""Ticket: {ticket_1} -> Entities: {entities_1}
            Ticket: {ticket_2} -> Entities: {entities_2}
            Ticket: {ticket_3} -> Entities: {entities_3}
            Ticket: {ticket_4} -> Entities: """

response = get_response(prompt)
print("Ticket: ", ticket_4)
print("Entities: ", response)


# Craft a prompt that asks the model for the function
prompt = "Write a Python function that accepts a list of 12 numbers representing sales for each month of the year, and outputs the month with the highest sales value"

response = get_response(prompt)
print(response)


examples = """input = [10, 5, 8] -> output = 24
input = [5, 2, 4] -> output = 12
input = [2, 1, 3] -> output = 7
input = [8, 4, 6] -> output = 19
"""

# Craft a prompt that asks the model for the function
prompt = f"""You are provided with input-output examples delimited by triple backticks for a Python function where different factors are associated with project completion time. Each example includes numerical values for the factors and the corresponding estimated completion time. Write a code for this function.
 ```{examples}```"""

response = get_response(prompt)
print(response)


function = """def calculate_area_rectangular_floor(width, length):
     return width*length"""

# Craft a multi-step prompt that asks the model to adjust the function
prompt = f"""Modify the script delimited by triple backticks as follows:
             - The function should return the perimeter of the rectangular floor as well.
             - The inputs (floor dimensions) should be positive. Otherwise, appropriate error messages should be displayed.
           ```{function}```"""

response = get_response(prompt)
print(response)


# added/edited
function = "\ndef analyze_portfolio(portfolio_data):\n  total_value = 0\n  highest_value = 0\n  lowest_value = float('inf')\n  \n  for entry in portfolio_data:\n    total_value += entry[1]\n    if entry[1] > highest_value:\n        highest_value = entry[1]\n    if entry[1] < lowest_value:\n        lowest_value = entry[1]\n\n  average_value = total_value / len(portfolio_data)\n  return highest_value, lowest_value, average_value\n  \n"

# Craft a chain-of-thought prompt that asks the model to explain what the function does
prompt = f"""Explain what the function delimited by triple backticks does. Let's think step by step
 ```{function}```
"""

response = get_response(prompt)
print(response)
