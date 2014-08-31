module TestCorpus
    using Base.Test
    using Languages
    using TextAnalysis

    sample_text1 = "This is a string"
    sample_text2 = "This is also a string"
    sample_file = Pkg.dir("TextAnalysis", "test", "data", "poem.txt")

    sd = StringDocument(sample_text1)
    fd = FileDocument(sample_file)
    td = TokenDocument(sample_text1)
    ngd = NGramDocument(sample_text1)

    crps = Corpus({sd, fd, td, ngd})

    documents(crps)

    for doc in crps
    	@assert isa(doc, AbstractDocument)
    end

    lexicon(crps)
    update_lexicon!(crps)
    lexicon(crps)

    inverse_index(crps)
    update_inverse_index!(crps)
    inverse_index(crps)

    hash_function(crps)
    hash_function!(crps, TextHashFunction())

    crps[1]
    crps["string"]
end
