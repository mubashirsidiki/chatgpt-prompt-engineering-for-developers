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
