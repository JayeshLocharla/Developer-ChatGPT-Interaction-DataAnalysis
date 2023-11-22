library(jsonlite)

# Load the provided JSON file
file_path <- 'D:\Software Engineering'
data <- fromJSON(file_path)

# Define the keywords to search for
keywords <- c(
    "I apologize for the confusion. You're correct.",
    "I apologize for the confusion earlier.",
    "I apologize for any confusion. You're right.",
    "I apologize for the previous confusion. You're right, the answers were contradicting.",
    "You're correct, and I apologize for any confusion.",
    "I apologize for misunderstanding your question earlier.",
    "Apologies for the confusion. It seems there's a bit of a misunderstanding here.",
    "You are correct. I apologize for the confusion.",
    "Apologies for the oversight.",
    "Apologies for the confusion.",
    "Ah, my apologies for misunderstanding.",
    "I apologize for the misunderstanding.",
    "My apologies for any confusion.",
    "I apologize for any confusion caused.",
    "I apologize for the unexpected behavior.",
    "I apologize if my previous responses may have been unclear.",
    "I apologize for the confusion and frustration, and I understand where you're coming from.",
    "I'm sorry for the inconvenience.",
    "Yes, indeed! Sorry for the confusion.",
    "I'm sorry, but as an AI text-based model, I don't have the capability to send SMS messages or access external libraries directly.",
    "Sorry for any confusion.",
    "Certainly, I apologize for any confusion.",
    "I apologize for the confusion and any incorrect information in my previous responses.",
    "I apologize for the inconvenience.",
    "I apologize for the confusion; it seems I misunderstood your requirements.",
    "I apologize for the continued difficulty. If the previous solutions did not resolve the issue, here are a few additional steps you can try",
    "You're absolutely right, and I apologize for the confusion caused by the previous responses.",
    "Sorry about that",
    "I apologize for the confusion and any incorrect information in my previous responses. You are absolutely correct.",
    "Thank you for pointing out those mistakes. I apologize for the confusion. You're correct"
)

# Filter the data based on keywords
filtered_data <- list()
total_count <- 0

for (item in data) {
    answer <- item$Answer
    for (keyword in keywords) {
        if (grepl(keyword, answer)) {
            filtered_data <- append(filtered_data, list(Answer = answer))
            total_count <- total_count + 1
            break  # Stop searching other keywords for this item
        }
    }
}

# Save the filtered data to a new JSON file
output_file_path <- 'D:\Software Engineering'
writeLines(toJSON(filtered_data, pretty = TRUE), output_file_path)

cat("Total Count:", total_count, "\n")
