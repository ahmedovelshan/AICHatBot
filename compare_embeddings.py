from langchain_ollama import OllamaEmbeddings
from langchain.evaluation import load_evaluator
from scipy.spatial.distance import cosine

def main():
    # Get embedding for a word.
    embedding_function = OllamaEmbeddings(model="nomic-embed-text")
    vector1 = embedding_function.embed_query("apple")
    vector2 = embedding_function.embed_query("iphone")
    print(f"Vector for 'apple': {vector1}")
    print(f"Vector for 'iphone': {vector2}")

    # Calculate cosine similarity
    distance = cosine(vector1, vector2)
    print(f"Cosine distance between 'apple' and 'iphone': {distance}")

if __name__ == "__main__":
    main()