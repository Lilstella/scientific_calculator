module PrecisionConfig

export @apply_precision

const PRECISION_CONFIG = Dict(
    :low      => (terms=10, tolerance=1e-3),
    :medium   => (terms=20, tolerance=1e-7),
    :high     => (terms=40, tolerance=1e-12),
    :extreme  => (terms=80, tolerance=1e-17)
)

macro apply_precision(calc, precision)
    quote
        haskey($PRECISION_CONFIG, $(esc(precision))) ||
            throw(ArgumentError("Invalid precision: $(esc(precision))"))

        cfg = $PRECISION_CONFIG[$(esc(precision))]

        $(esc(calc)).precision = $(esc(precision))
        $(esc(calc)).terms = cfg.terms
        $(esc(calc)).tolerance = typeof($(esc(calc)).value)(cfg.tolerance)

        $(esc(calc))
    end
end

end