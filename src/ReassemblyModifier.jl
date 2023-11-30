module ReassemblyModifier

# Write your package code here.
# Some notes
# I want to quickly make edits to wide sections of blocks with a couple of
# simple function calls.
# What does SF need to do?
# defineBlock( dump in your struct )
# features_modify_set!
# features_modify_add!
# features_modify_remove!
# field_modify_multiply!
# field_modify_add!
# field_modify_set!

function features_modify_set!(block, set_features)
    features_key = "features"
    block[ features_key ] = set_features
    nothing
end


end
