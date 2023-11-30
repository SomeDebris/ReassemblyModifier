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
const FEATURES_KEY = "features"

function features_set!(block, set_features)
    block[ FEATURES_KEY ] = set_features
    nothing
end

function features_add!(block, add_features)
    if haskey( block, FEATURES_KEY )
        block[ FEATURES_KEY ].append!( add_features )
    else
        block[ FEATURES_KEY ] = add_features
    end
    nothing
end


end