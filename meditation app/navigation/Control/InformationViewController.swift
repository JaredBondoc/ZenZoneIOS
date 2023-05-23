//
//  InformationViewController.swift
//  navigation
//
//  Created by jared b on 24/5/2023.
//

import UIKit

class InformationViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create a UIScrollView
        let scrollView = UIScrollView(frame: view.bounds)
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(scrollView)
        
        // Create a UITextView
        let textView = UITextView(frame: scrollView.bounds)
        textView.isEditable = false
        textView.isSelectable = true
        textView.backgroundColor = .clear
        
        // Set the text content
        let text = "Introduction to Mindfulness Meditation\n\nWhat is Mindfulness Meditation?\n\nMindfulness meditation is a practice that involves focusing one's attention on the present moment, non-judgmentally, and with an attitude of curiosity and acceptance. It is a centuries-old technique derived from Buddhist traditions but has gained significant popularity in recent years due to its numerous benefits for mental, emotional, and physical well-being.\n\nWhy Practice Mindfulness Meditation?\n\nIn our fast-paced and often stressful modern lives, it is easy to get caught up in the constant stream of thoughts, worries, and distractions. Mindfulness meditation offers a powerful antidote to this chaos by training our minds to be fully present and aware. By practicing mindfulness, we cultivate a deeper sense of self-awareness, compassion, and resilience, enabling us to navigate life's challenges with greater clarity and equanimity. \nResearch has shown that regular mindfulness meditation can have a profound impact on various aspects of our lives. It has been associated with reduced stress, anxiety, and depression, improved focus and attention, enhanced emotional regulation, and increased overall well-being. Moreover, mindfulness can help foster healthier relationships, boost creativity, and promote a greater sense of connection with ourselves and others. \n\nHow to Practice Mindfulness Meditation?\n\nMindfulness meditation can be practiced in various ways, but the core principle remains the same: to bring focused attention to the present moment. Here are some basic steps to get started:\n1. Find a quiet and comfortable space: Choose a calm environment where you can sit without distractions. It can be a dedicated meditation space or simply a quiet corner of your home.\n2. Assume a comfortable posture: Sit in a position that allows you to be both alert and relaxed. You can sit cross-legged on a cushion, on a chair with your feet planted firmly on the ground, or even lie down if necessary.\n3. Focus on your breath: Close your eyes and bring your attention to your breath. Notice the sensation of the breath as it enters and leaves your body. You can choose to focus on the rising and falling of your abdomen or the feeling of air passing through your nostrils.\n4. Be aware of thoughts and sensations: As you practice, thoughts, emotions, and physical sensations may arise. Instead of trying to suppress or engage with them, simply acknowledge their presence and let them go, gently bringing your attention back to the breath.\n5. Cultivate non-judgmental awareness: Approach your practice with a mindset of acceptance and non-judgment. Treat each moment, thought, or sensation that arises with curiosity and kindness, without labeling them as good or bad.\n6. Start with short sessions: Begin with shorter meditation sessions, such as 5-10 minutes, and gradually increase the duration as you become more comfortable and consistent in your practice.\nRemember, mindfulness meditation is a skill that develops over time with regular practice. It is perfectly normal to have a wandering mind or encounter difficulties, but with patience and perseverance, you can reap the benefits of this transformative practice."
        
        let attributedText = NSMutableAttributedString(string: text)        
        // Apply heading font to the titles of the subsections
        let headingFont = UIFont.boldSystemFont(ofSize: 23)
        
        // Find the range of each title and apply the heading font
        if let range = text.range(of: "Introduction to Mindfulness Meditation") {
            attributedText.addAttribute(.font, value: headingFont, range: NSRange(range, in: text))
        }
        
        if let range = text.range(of: "What is Mindfulness Meditation?") {
            attributedText.addAttribute(.font, value: headingFont, range: NSRange(range, in: text))
        }
        
        if let range = text.range(of: "Why Practice Mindfulness Meditation?") {
            attributedText.addAttribute(.font, value: headingFont, range: NSRange(range, in: text))
        }
        
        if let range = text.range(of: "How to Practice Mindfulness Meditation?") {
            attributedText.addAttribute(.font, value: headingFont, range: NSRange(range, in: text))
        }
        
        textView.attributedText = attributedText
        
        // Add the UITextView to the UIScrollView
        scrollView.addSubview(textView)
        
        // Set the content size of the UIScrollView to match the UITextView's content size
        scrollView.contentSize = textView.contentSize
        let topInset: CGFloat = 50
        textView.contentInset = UIEdgeInsets(top: topInset, left: 0, bottom: 0, right: 0)
    }
}
